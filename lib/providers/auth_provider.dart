import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  String? _token;

  String? get token => _token;
  bool get isAuthenticated => _token != null;

  // Login
  Future<bool> login(String email, String password) async {
    _token = await AuthService.loginUser(email, password);
    notifyListeners();
    return _token != null;
  }

  // Register
  Future<bool> register(String username, String email, String password) async {
    _token = await AuthService.registerUser(username, email, password);
    notifyListeners();
    return _token != null;
  }

  // Logout
  void logout() {
    AuthStorage.clearToken();
    _token = null;
    notifyListeners();
  }
}
