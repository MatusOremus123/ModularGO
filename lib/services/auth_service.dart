import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String baseUrl = "https://mad-shop.onrender.com/api/auth/local";

  // Login Function
  static Future<String?> loginUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "identifier": email,
          "password": password
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data.containsKey("jwt")) {
        await AuthStorage.saveToken(data["jwt"]); // Save token
        return data["jwt"];
      } else {
        return null;
      }
    } catch (e) {
      print("Login Error: $e");
      return null;
    }
  }

  // Register Function
  static Future<String?> registerUser(String username, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/register"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": username,
          "email": email,
          "password": password
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data.containsKey("jwt")) {
        await AuthStorage.saveToken(data["jwt"]); // Save token
        return data["jwt"];
      } else {
        return null;
      }
    } catch (e) {
      print("Registration Error: $e");
      return null;
    }
  }
}

// Token Storage Helper
class AuthStorage {
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }
}
