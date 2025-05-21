import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];
  List<Map<String, dynamic>> wishlist = [];

  List<Map<String, dynamic>> get cartItems => List.unmodifiable(_cartItems);

  void addToCart(Map<String, dynamic> product) {
    _cartItems.add(product);
    notifyListeners(); // Notify listeners that the data has changed
  }

  void updateCart(List<Map<String, dynamic>> updatedCart) {
    _cartItems
      ..clear()
      ..addAll(updatedCart);
    notifyListeners();
  }

  void removeFromCart(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems.removeAt(index);
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  void addToWishlist(Map<String, dynamic> product) {
    wishlist.add(product);
    notifyListeners();
  }

  void removeFromWishlist(int index) {
    wishlist.removeAt(index);
    notifyListeners();
  }
}
