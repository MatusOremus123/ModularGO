import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/order_model.dart';

class OrderService {
  final String baseUrl = "https://mad-shop.onrender.com/api";

  Future<void> placeOrder({
    required Order order,
    required String jwt,
  }) async {

    final requestBody = {
      'data': order.toJson(),
    };


    print('Request Body: ${jsonEncode(requestBody)}');

    final response = await http.post(
      Uri.parse('$baseUrl/orders?populate=*'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $jwt',
      },
      body: jsonEncode(requestBody),
    );


    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Order placed successfully: ${response.body}');
    } else {
      throw Exception('Failed to place order: ${response.body}');
    }
  }
}