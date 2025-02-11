import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ApiService {
  static const String _baseUrl = 'https://mad-shop.onrender.com/api/products';

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl?populate=*'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        final List<dynamic> data = responseBody['data'] ?? [];
        return data.map((item) => Product.fromJson(item)).toList();
      }
      throw Exception('HTTP Error ${response.statusCode}');
    } catch (e) {
      throw Exception('Failed to load products: ${e.toString()}');
    }
  }
}