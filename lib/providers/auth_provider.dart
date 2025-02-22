import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;


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
    notifyListeners();
  }
}