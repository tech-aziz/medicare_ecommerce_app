import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/cart_item_mode.dart';
import 'package:http/http.dart' as http;
import '../res/component/custom_button.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
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
          'Authorization': "Bearer ${preferences.getString("token")}"
        },
        body: jsonEncode(orderData),
      );
      debugPrint(response.statusCode.toString());
      // Handle response
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(responseData);
        // Show success message
        Get.snackbar('Success', 'Order placed successfully!',
            snackPosition: SnackPosition.BOTTOM);

        // Optionally, clear the cart or navigate to a success page
      } else {
        // Show error message
        Get.snackbar('Error', 'Failed to place order. Please try again.',
            snackPosition: SnackPosition.BOTTOM);
        print('Error: ${response.body}');
      }
    } catch (e) {
      // Handle any exceptions
      Get.snackbar('Error', '$e',
          snackPosition: SnackPosition.BOTTOM);
      print('Exception: $e');
    }
  }

  final List<CartItem> cart = [];

  static const String _cartKey = "cart_data";
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
                leading: const Icon(Icons.money),
                title: const Text("Cash on Delivery"),
                onTap: () {
                  final orderData = {
                    "order": {
                      "orderDate": "2024-12-21",
                      "subTotal": total,
                      "discount": 0,
                      "total": total,
                      "paid": total,
                      "payment_type": "bkash", // or "bkash"
                      "note": "Order placed successfully",
                    },
                    "cart": cart
                  };

                  checkoutOrder(orderData);
                  Navigator.pop(context);

                  // _showOrderSuccessSnackbar("Cash on Delivery");
                },
              ),
              ListTile(
                leading: const Icon(Icons.payment),
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

  /// Load cart from SharedPreferences
  Future<void> loadCartFromLocal() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final cartJson = prefs.getString(_cartKey);

      if (cartJson != null) {
        final List<dynamic> cartData = jsonDecode(cartJson);
        cart.clear();
        cart.addAll(cartData.map((item) => CartItem.fromJson(item)).toList());
        setState(() {});
        print("Cart loaded from local storage: $cart");
      } else {
        print("No cart data found in local storage.");
      }
    } catch (e) {
      print("Error loading cart from local storage: $e");
    }
  }

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
  void initState() {
    super.initState();
    loadCartFromLocal();
  }

  /// Calculate subtotal, tax, and total
  double get subtotal => cart.fold(0, (sum, item) => sum + item.total);
  // double get tax => subtotal * 1; // 5% tax
  double get total => subtotal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: cart.isEmpty
            ? const Center(child: Text("Your cart is empty!"))
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      itemCount: cart.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.withOpacity(0.1),
                            ),
                            child: ListTile(
                              leading: Image.asset(
                                'assets/images/tafnil.png',
                                fit: BoxFit.contain,
                              ),
                              title: Text(
                                cart[index].productName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Price: ৳${cart[index].unitRate}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: Container(
                                width: 90,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          cart[index].quantity--;
                                          if (cart[index].quantity <= 0) {
                                            cart.removeAt(index);
                                          }
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        size: 12,
                                      ),
                                    ),
                                    Text(
                                      cart[index].quantity.toString(),
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          cart[index].quantity++;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        size: 10,
                                      ),
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

                    /// Coupon Code Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Apply Coupon Code",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.check_circle,
                                color: Colors.green),
                            onPressed: () {
                              // Add coupon code functionality here
                            },
                          ),
                        ),
                      ),
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
                                "৳${subtotal.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Discount",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "৳ 0",
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
                                "৳${total.toStringAsFixed(2)}",
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
          onTap: () {
            // Handle checkout functionality
            showPaymentOptions();
          },
        ),
      ),
    );
  }
}
