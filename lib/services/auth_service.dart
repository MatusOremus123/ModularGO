import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = "https://mad-shop.onrender.com/api";

  // Register a new user
  Future<http.Response> registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/local/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    // Log the response for debugging
    print('Registration Response: ${response.statusCode}');
    print('Response Body: ${response.body}');

    return response;
  }

  // Login an existing user
  Future<http.Response> loginUser({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/local'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'identifier': email,
        'password': password,
      }),
    );

    // Log the response for debugging
    print('Login Response: ${response.statusCode}');
    print('Response Body: ${response.body}');

    return response;
  }
}