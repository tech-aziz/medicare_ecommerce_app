import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/cart_item_mode.dart';

class CartManager {
  final List<CartItem> cart = [];

  static const String _cartKey = "cart_data";

  /// Add or update product in the cart
  Future<void> addToCart(
      int productId, int quantity, double unitRate, String productName) async {
    try {
      // Check if the product already exists in the cart
      final newItem = CartItem(
        productName: productName,
        productId: productId,
        quantity: quantity,
        unitRate: unitRate,
      );
      cart.add(newItem);

      // Save the updated cart to SharedPreferences
      await saveCartToLocal();
    } catch (e) {
      print("Error adding to cart: $e");
    }
  }

  /// Save cart to SharedPreferences
  Future<void> saveCartToLocal() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final cartJson = jsonEncode(cart.map((item) => item.toJson()).toList());
      await prefs.setString(_cartKey, cartJson);
      print("Cart saved to local storage: $cartJson");
    } catch (e) {
      print("Error saving cart to local storage: $e");
    }
  }

  /// Load cart from SharedPreferences

  /// Get cart data as JSON
  List<Map<String, dynamic>> getCartAsJson() {
    return cart.map((item) => item.toJson()).toList();
  }

  /// Clear the cart and local storage
  Future<void> clearCart() async {
    cart.clear();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
    print("Cart cleared from memory and local storage.");
  }

  @override
  String toString() {
    return cart.map((item) => item.toString()).toList().toString();
  }
}
