import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_ecommerce_app/app/all_product/view/product_controller.dart';
import 'package:medicare_ecommerce_app/app/bottom_pages/category_body/category_controller.dart';

import '../../cart/cart_manager.dart';
import '../../res/color.dart';

class CategoryWiseProduct extends StatefulWidget {
  final String data;
  final String name;
  const CategoryWiseProduct({super.key, required this.data, required this.name});

  @override
  State<CategoryWiseProduct> createState() => _CategoryWiseProductState();
}

class _CategoryWiseProductState extends State<CategoryWiseProduct> {
  @override
  void initState() {
    super.initState();
    final CompanyController productController = Get.put(CompanyController());
    productController.fetchProducts(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    final CompanyController productController = Get.find<CompanyController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (productController.cachedProducts.isEmpty) {
          return const Center(child: Text('No products found'));
        }

        return ListView.builder(
          itemCount: productController.cachedProducts.length,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            final product = productController.cachedProducts[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: ListTile(
                  leading: product.imageName != null
                      ? Image.network(
                          'https://example.com/images/${product.imageName}',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
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
      }),
    );
  }
}
