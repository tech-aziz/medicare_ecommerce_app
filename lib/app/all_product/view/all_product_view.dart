import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_ecommerce_app/app/all_product/view/product_controller.dart';

import '../../cart/cart_manager.dart';
import '../../res/color.dart';

class AllProductView extends StatelessWidget {
  const AllProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    return
      

////ak
        Obx(() {
      if (productController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (productController.productList.isEmpty) {
        return const Center(child: Text('No products found'));
      }

      return ListView.builder(
        itemCount: productController.productList.length,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) {
          final product = productController.productList[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: ListTile(
                // leading: product.imageName != null
                //     ? Image.network(
                //         'https://example.com/images/${product.imageName}',
                //         fit: BoxFit.contain,
                //       )
                //     : Image.asset('assets/images/placeholder.png',
                //         fit: BoxFit.contain),
                leading: product.imageName != null
                    ? Image.network(
                        'https://example.com/images/${product.imageName}',
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          // Show default image if network image fails to load
                          return Image.asset('assets/images/tafnil.png',
                              fit: BoxFit.contain);
                        },
                      )
                    : Image.asset('assets/images/tafnil.png',
                        fit: BoxFit.contain),
                title: Text(product.productName.toString()),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productCategoryName.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          ' ${product.convertionName}',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '৳${product.productSellingPrice}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            CartManager().addToCart(
                                int.parse(product.productSlNo.toString()),
                                1,
                                double.parse(product.productSlNo.toString()),
                                product.productName.toString());

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Added to cart successfully!'),
                                duration: const Duration(seconds: 2),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.green,
                            ),
                            child: const Text(
                              'Add to cart',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
