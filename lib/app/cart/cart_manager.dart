import '../../utils/cart_item_mode.dart';

class CartManager {
  /// Singleton instance to ensure global access and state persistence
  static final CartManager _instance = CartManager._internal();

  factory CartManager() => _instance;

  CartManager._internal();

  final List<CartItem> _cart = []; // Private cart list

  /// Expose the cart as an unmodifiable list
  List<CartItem> get cart => List.unmodifiable(_cart);
  List<String> imagesCartProduct = [];

  /// Add or update product in the cart
  void addToCart(int productId, int quantity, double unitRate,
      String productName, String productImage) {
    try {
      // Check if the product already exists in the cart
      final existingItemIndex =
          _cart.indexWhere((item) => item.productId == productId);

      if (existingItemIndex != -1) {
        // Update the quantity of the existing product
        _cart[existingItemIndex].quantity += quantity;
      } else {
        // Add the new product to the cart
        final newItem = CartItem(
          productName: productName,
          productId: productId,
          quantity: quantity,
          unitRate: unitRate,
        );
        _cart.add(newItem);
        imagesCartProduct.add(productImage);
      }
    } catch (e) {
      print("Error adding to cart: $e");
    }
  }

  /// Remove a product from the cart
  void removeFromCart(int productId) {
    try {
      _cart.removeWhere((item) => item.productId == productId);
      // imagesCartProduct.re
    } catch (e) {
      print("Error removing product from cart: $e");
    }
  }

  /// Clear the cart
  void clearCart() {
    _cart.clear();
  }

  /// Calculate subtotal
  double get subtotal => _cart.fold(0, (sum, item) => sum + item.total);

  /// Calculate total (modify if additional charges apply)
  double get total => subtotal;

  @override
  String toString() {
    return _cart.map((item) => item.toString()).toList().toString();
  }
}
