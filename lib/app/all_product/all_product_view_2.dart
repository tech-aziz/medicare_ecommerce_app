import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_ecommerce_app/app/all_product/view/product_controller.dart';

import '../cart/cart_manager.dart';

class AllProductView2 extends StatefulWidget {
  const AllProductView2({super.key});

  @override
  State<AllProductView2> createState() => _AllProductView2State();
}

class _AllProductView2State extends State<AllProductView2> {
  final ProductController productController = Get.put(ProductController());
  final TextEditingController _searchController = TextEditingController();
  RxList filteredProducts = [].obs;

  @override
  void initState() {
    super.initState();
    // Initially, all products are displayed
    filteredProducts.value = productController.productList;
    _searchController.addListener(_filterProducts);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterProducts() {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      filteredProducts.value = productController.productList;
    } else {
      filteredProducts.value = productController.productList.where((product) {
        final productName = product.productName.toString().toLowerCase();
        return productName.contains(query);
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Product'),
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (productController.productList.isEmpty) {
          return const Center(child: Text('No products found'));
        }

        return Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search product...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),

            // Product List
            Expanded(
              child: ListView.builder(
                itemCount: filteredProducts.length,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
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
                                'https://app.tophealthpharma.com/uploads/products/${product.imageName}',
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  // Show default image if network image fails to load
                                  return Image.network(
                                      'https://app.tophealthpharma.com/assets/no_image.gif',
                                      fit: BoxFit.contain);
                                },
                              )
                            : Image.network(
                                'https://app.tophealthpharma.com/assets/no_image.gif',
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
                                        int.parse(
                                            product.productSlNo.toString()),
                                        1,
                                        double.parse(
                                            product.productSlNo.toString()),
                                        product.productName.toString(),
                                        product.imageName);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            Text('Added to cart successfully!'),
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
              ),
            ),
          ],
        );
      }),
    );
  }
}
