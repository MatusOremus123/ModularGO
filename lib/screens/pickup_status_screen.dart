import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/pickup_service.dart';
import '../models/pickup_model.dart';
import '../providers/auth_provider.dart';

class PickupStatusScreen extends StatefulWidget {
  final String pickupDocumentId;

  const PickupStatusScreen({super.key, required this.pickupDocumentId});

  @override
  State<PickupStatusScreen> createState() => _PickupStatusScreenState();
}

class _PickupStatusScreenState extends State<PickupStatusScreen> {
  late PickupService _service;
  Timer? _timer;
  Pickup? _pickup;
  String? _error;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    final authProvider = context.read<AuthProvider>();

    _service = PickupService(
      baseUrl: 'https://mad-shop.onrender.com',
      jwt: authProvider.token,
    );

    _startPolling();
  }

  void _startPolling() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      try {
        final status = await _service.getPickupStatus(widget.pickupDocumentId);
        setState(() {
          _pickup = status;
          _loading = false;
          if (status.progress == 'finished') {
            _timer?.cancel();
            _handleCompletion();
          }
        });
      } catch (e) {
        _timer?.cancel();
        setState(() => _error = e.toString());
      }
    });
  }

  void _handleCompletion() {
    final allPicked = _pickup?.items.every((item) => item.shipped >= item.required) ?? false;

    if (allPicked) {
      Navigator.pushReplacementNamed(context, '/order-success');
    } else {
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

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ongoing Pickup')),
      body: _loading
          ? _buildLoading()
          : _error != null
          ? _buildError()
          : _buildContent(),
    );
  }

  Widget _buildContent() => SingleChildScrollView(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Text('Pickup ID: ${_pickup!.documentId}'),
        const SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _pickup!.items.length,
          itemBuilder: (_, index) => ListTile(
            title: Text(_pickup!.items[index].product),
            subtitle: Text('${_pickup!.items[index].shipped}/${_pickup!.items[index].required}'),
          ),
        ),
      ],
    ),
  );

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  Widget _buildError() => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_error!),
        ElevatedButton(
          onPressed: _startPolling,
          child: const Text('Retry'),
        ),
      ],
    ),
  );
}
