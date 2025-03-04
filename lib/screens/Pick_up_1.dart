import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../providers/auth_provider.dart';
import '../services/pickup_service.dart';
import '../models/pickup_model.dart';

class PickUp1 extends StatefulWidget {
  final String orderDocumentId;

  const PickUp1({super.key, required this.orderDocumentId});

  @override
  State<PickUp1> createState() => _PickUp1State();
}

class _PickUp1State extends State<PickUp1> {
  late PickupService _pickupService;
  Timer? _pollingTimer;
  Pickup? _currentPickup;
  String? _error;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    final authProvider = context.read<AuthProvider>();
    final jwt = authProvider.token;

    if (jwt == null) {
      setState(() {
        _error = 'Authentication error: Missing JWT token.';
        _isLoading = false;
      });
      return;
    }

    _pickupService = PickupService(
      baseUrl: 'https://mad-shop.onrender.com',
      jwt: jwt,
    );

    _initializePickup();
  }

  Future<void> _initializePickup() async {
    try {
      final pickup = await _pickupService.startPickup(widget.orderDocumentId);
      _startPolling(pickup.documentId);
      setState(() {
        _isLoading = false;
        _currentPickup = pickup;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void _startPolling(String pickupDocumentId) {
    _pollingTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      try {
        final status = await _pickupService.getPickupStatus(pickupDocumentId);
        if (!mounted) return;

        setState(() => _currentPickup = status);

        if (status.progress == 'finished') {
          timer.cancel();
          _handleCompletion();
        }
      } catch (e) {
        timer.cancel();
        if (mounted) {
          setState(() => _error = 'Polling error: ${e.toString()}');
        }
      }
    });
  }

  void _handleCompletion() {
    final allPicked = _currentPickup?.items.every(
          (item) => item.shipped >= item.required,
    ) ?? false;

    if (allPicked) {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/order-success');
      }
    } else {
      if (mounted) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Partial Pickup'),
            content: const Text('Some items were not fully picked up'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('OK'),
              )
            ],
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _pollingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return _buildLoading();
    if (_error != null) return _buildError();

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          // Header Section
          Container(
            height: 200,
            color: Colors.greenAccent,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/MODULAR.png',
                  height: 40,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: _currentPickup?.progress == 'started' ? 0.5 : 0.0,
                ),
              ],
            ),
          ),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // QR Code Section
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        QrImageView(
                          data: _currentPickup?.documentId ?? 'Invalid Pickup',
                          size: screenWidth * 0.7,
                          errorStateBuilder: (ctx, err) =>
                              Text('QR Error: $err'),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Present QR code to machine scanner',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  // Status Information
                  if (_currentPickup != null) ...[
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Pickup Status:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _currentPickup!.progress.toUpperCase(),
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 20),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _currentPickup!.items.length,
                            separatorBuilder: (_, __) => const Divider(),
                            itemBuilder: (context, index) {
                              final item = _currentPickup!.items[index];
                              return ListTile(
                                title: Text(item.product),
                                trailing: Text(
                                  '${item.shipped}/${item.required}',
                                  style: TextStyle(
                                    color: item.shipped >= item.required
                                        ? Colors.green
                                        : Colors.orange,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  Widget _buildError() => Center(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 50, color: Colors.red),
          const SizedBox(height: 20),
          Text(
            _error!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.red),
          ),
        ],
      ),
    ),
  );
}
