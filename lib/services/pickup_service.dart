import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pickup_model.dart';

class PickupService {
  final String baseUrl;
  final String? jwt;

  PickupService({required this.baseUrl, this.jwt});

  Future<Pickup> startPickup(String orderDocumentId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/orders/$orderDocumentId/start-pickup'),
      headers: {
        'Content-Type': 'application/json',
        if (jwt != null) 'Authorization': 'Bearer $jwt',
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        return Pickup.fromJson(json.decode(response.body));
      } catch (e) {
        throw Exception('''
          Failed to parse pickup response: ${e.toString()}
          Response body: ${response.body}
        ''');
      }
    } else {
      throw Exception('Start pickup failed: ${response.statusCode}\n${response.body}');
    }
  }

  Future<Pickup> getPickupStatus(String pickupDocumentId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/pickups/$pickupDocumentId'),
      headers: {
        if (jwt != null) 'Authorization': 'Bearer $jwt',
      },
    );

    if (response.statusCode == 200) {
      return Pickup.fromJson(json.decode(response.body));
    } else {
      throw Exception('Get pickup status failed: ${response.statusCode}\n${response.body}');
    }
  }
}
