import '../../utils/cart_item_mode.dart';

class CartManager {
  /// Singleton instance for global access and state persistence
  static final CartManager _instance = CartManager._internal();

  factory CartManager() => _instance;

  CartManager._internal();

  final List<CartItem> _cart = []; // Private cart list
  final List<String> imagesCartProduct = [];

  double _total = 0.0; // Private total field

  /// Expose the cart as an unmodifiable list
  List<CartItem> get cart => List.unmodifiable(_cart);

  /// Getter for the total value
  double get total => _total;

  /// Add or update product in the cart
  void addToCart({
    required int productId,
    required int quantity,
    required double unitRate,
    required String productName,
    required String productImage,
  }) {
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

      // Recalculate the total
      _updateTotalValue();
    } catch (e) {
      print("Error adding to cart: $e");
    }
  }

  /// Increase quantity for a specific product
  void increaseQuantity(int productId) {
    final index = _cart.indexWhere((item) => item.productId == productId);
    if (index != -1) {
      _cart[index].quantity++;
      _updateTotalValue();
    }
  }

  /// Decrease quantity for a specific product
  void decreaseQuantity(int productId) {
    final index = _cart.indexWhere((item) => item.productId == productId);
    if (index != -1) {
      _cart[index].quantity--;
      if (_cart[index].quantity <= 0) {
        _cart.removeAt(index); // Remove item if quantity is zero
        imagesCartProduct.removeAt(index);
      }
      _updateTotalValue();
    }
  }

  /// Remove a product from the cart
  void removeFromCart(int productId) {
    try {
      final existingItemIndex =
          _cart.indexWhere((item) => item.productId == productId);

      if (existingItemIndex != -1) {
        _cart.removeAt(existingItemIndex);
        imagesCartProduct.removeAt(existingItemIndex);
      }

      // Recalculate the total
      _updateTotalValue();
    } catch (e) {
      print("Error removing product from cart: $e");
    }
  }

  /// Clear the cart
  void clearCart() {
    _cart.clear();
    imagesCartProduct.clear();

    // Reset the total
    _updateTotalValue();
  }

  /// Recalculate the total value based on the current cart items
  void _updateTotalValue() {
    _total = _cart.fold(0, (sum, item) => sum + (item.unitRate * item.quantity));
    print("Updated total: $_total");
  }

  @override
  String toString() {
    return _cart.map((item) => item.toString()).toList().toString();
  }
}
