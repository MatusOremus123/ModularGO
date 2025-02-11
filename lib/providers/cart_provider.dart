
import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;


  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }


  void removeItem(int id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }


  void updateQuantity(int id, int quantity) {
    final item = _items.firstWhere((item) => item.id == id);
    item.quantity = quantity;
    notifyListeners();
  }


  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.price * item.quantity);
  }
}