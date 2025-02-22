import 'dart:convert';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoggedIn = false;
  String? _token;
  String? _userId;

  bool get isLoggedIn => _isLoggedIn;
  String? get token => _token;
  String? get userId => _userId;

  Future<void> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authService.registerUser(
        username: username,
        email: email,
        password: password,
      );

      if (response.statusCode == 200) {
        _isLoggedIn = true;
        notifyListeners();
      } else {
        throw Exception('Failed to register: ${response.body}');
      }
    } catch (e) {
      throw Exception('Registration error: $e');
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authService.loginUser(
        email: email,
        password: password,
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        _token = responseBody['jwt'];
        _userId = responseBody['user']['id'].toString();
        _isLoggedIn = true;
        notifyListeners();
      } else {
        throw Exception('Failed to login: ${response.body}');
      }
    } catch (e) {
      throw Exception('Login error: $e');
    }
  }

  void logout() {
    _isLoggedIn = false;
    _token = null;
    _userId = null;
    notifyListeners();
  }
}