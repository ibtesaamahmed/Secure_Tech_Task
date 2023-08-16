import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductViewModel with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> loadingState(bool loading) async {
    if (loading == true) {
      _isLoading = true;
    } else {
      _isLoading = false;
    }
    notifyListeners();
  }

  Future<void> fetchAndSetProducts() async {
    final url = Uri.parse('https://fakestoreapi.com/products');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      _products = jsonData.map((data) => Product.fromJson(data)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed Fetching');
    }
  }
}
