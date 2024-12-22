import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/cart_item_mode.dart';
import '../res/component/custom_button.dart';
import 'cart_manager.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final cartManager = CartManager(); // Access the singleton instance

  /// Checkout order method
  void checkoutOrder(Map<String, dynamic> orderData) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    const String apiUrl =
        "https://app.tophealthpharma.com/api/v1/order_place"; // Replace with your actual API endpoint

    try {
      // Make POST request
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${preferences.getString('token')}", // Replace as needed
        },
        body: jsonEncode(orderData),
      );

      debugPrint(response.statusCode.toString());

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(responseData);

        // Show success message
        Get.snackbar('Success', 'Order placed successfully!',
            snackPosition: SnackPosition.BOTTOM);

        // Clear the cart
        setState(() {
          cartManager.clearCart();
        });
      } else {
        // Show error message
        Get.snackbar('Error', 'Failed to place order. Please try again.',
            snackPosition: SnackPosition.BOTTOM);
        print('Error: ${response.body}');
      }
    } catch (e) {
      // Handle any exceptions
      Get.snackbar('Error', '$e', snackPosition: SnackPosition.BOTTOM);
      print('Exception: $e');
    }
  }

  /// Show payment options
  void showPaymentOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Select Payment Method",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: Image.asset(
                  "assets/icons/cash.png",
                  height: 50,
                  width: 50,
                ),
                title: const Text("Cash on Delivery"),
                onTap: () {
                  final orderData = {
                    "order": {
                      "orderDate": DateTime.now().toIso8601String(),
                      "subTotal": cartManager.subtotal,
                      "discount": 0,
                      "total": cartManager.total,
                      "paid": cartManager.total,
                      "payment_type": "cod",
                      "note": "Order placed successfully",
                    },
                    "cart":
                        cartManager.cart.map((item) => item.toJson()).toList()
                  };

                  checkoutOrder(orderData);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Image.asset(
                  "assets/icons/bkash.png",
                  height: 50,
                  width: 50,
                ),
                title: const Text("Bkash"),
                onTap: () {
                  Navigator.pop(context);
                  _showOrderSuccessSnackbar("Bkash");
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// Show success message
  void _showOrderSuccessSnackbar(String paymentMethod) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Order submitted successfully via $paymentMethod!"),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: cartManager.cart.isEmpty
            ? const Center(child: Text("Your cart is empty!"))
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      itemCount: cartManager.cart.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = cartManager.cart[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.withOpacity(0.1),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(8),
                              leading: SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  'assets/images/tafnil.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              title: Text(
                                item.productName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              subtitle: Text(
                                "Price: ৳${item.unitRate * item.quantity}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: SizedBox(
                                width: 110,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          item.quantity--;
                                          if (item.quantity <= 0) {
                                            item.quantity++;
                                          }
                                        });
                                      },
                                      icon: const Icon(Icons.remove, size: 16),
                                    ),
                                    Text(
                                      item.quantity.toString(),
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          item.quantity++;
                                        });
                                      },
                                      icon: const Icon(Icons.add, size: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),

                    /// Pricing Details
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Subtotal",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "৳${cartManager.subtotal.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Divider(thickness: 1, height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "৳${cartManager.total.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: customButton(
          btnName: 'Checkout',
          color: Colors.blueAccent,
          textColor: Colors.white,
          borderColor: Colors.transparent,
          context: context,
          onTap: showPaymentOptions,
        ),
      ),
    );
  }
}
