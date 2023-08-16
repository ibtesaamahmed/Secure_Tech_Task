import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthViewModel with ChangeNotifier {
  bool _isPasswordVisible = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  bool get isPasswordVisible => _isPasswordVisible;
  TextEditingController get usernameController => _usernameController;
  TextEditingController get passwordController => _passwordController;
  bool get isLoading => _isLoading;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void disposeControllers() {
    _usernameController.dispose();
    _passwordController.dispose();
  }

  Future<void> loadingState(bool loading) async {
    if (loading == true) {
      _isLoading = true;
    } else {
      _isLoading = false;
    }
    notifyListeners();
  }

  Future<bool> login(String userName, String password) async {
    final url = Uri.parse('https://fakestoreapi.com/auth/login');
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final Map<String, String> requestBody = {
      'username': userName,
      'password': password,
    };

    loadingState(true);
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(requestBody),
    );
    loadingState(false);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
