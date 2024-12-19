import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_ecommerce_app/app/all_product/view/product_controller.dart';

import '../../res/color.dart';

class AllProductView extends StatelessWidget {
  const AllProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    return
        //   ListView.builder(
        //               itemCount: 10,
        //               shrinkWrap: true,
        //               primary: false,
        //               itemBuilder: (context, index) {
        //               return Padding(
        //                 padding: const EdgeInsets.only(bottom: 12),
        //                 child: Container(
        //                   decoration: BoxDecoration(
        //                       borderRadius: BorderRadius.circular(12),
        //                       color: Colors.grey.withOpacity(0.1)),
        //                   child: ListTile(
        //                     leading: Image.asset('assets/images/tafnil.png',
        //                         fit: BoxFit.contain),
        //                     title: const Text('Eskayef Pharmaceuticals Ltd.'),
        //                     subtitle: Column(
        //                       mainAxisAlignment: MainAxisAlignment.start,
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         const Text(
        //                           'Tufnil Tablet- (200mg)',
        //                           style: TextStyle(
        //                               color: Colors.black, fontWeight: FontWeight.bold),
        //                         ),
        //                         Row(
        //                           children: [
        //                             Text(
        //                               '1 pcs',
        //                               style: TextStyle(
        //                                   color: Colors.black.withOpacity(0.6),
        //                                   fontWeight: FontWeight.normal),
        //                             ),
        //                             const SizedBox(
        //                               width: 5,
        //                             ),
        //                             Container(
        //                               padding: const EdgeInsets.all(4),
        //                               decoration: BoxDecoration(
        //                                 borderRadius: BorderRadius.circular(6),
        //                                 color: Colors.red.withOpacity(0.2),
        //                               ),
        //                               child: const Text(
        //                                 '+10% Discount',
        //                                 style: TextStyle(color: Colors.red),
        //                               ),
        //                             )
        //                           ],
        //                         ),
        //                         Row(
        //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                           children: [
        //                             const Text(
        //                               '৳90.00',
        //                               style: TextStyle(
        //                                   color: Colors.black,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                             const SizedBox(
        //                               width: 5,
        //                             ),
        //                             Text(
        //                               '100.00',
        //                               style: TextStyle(color: Colors.black.withOpacity(0.6),
        //                                 decoration:
        //                                 TextDecoration.lineThrough,),
        //                             ),
        //                             const Spacer(),
        //                             Container(
        //                               padding: const EdgeInsets.all(8),
        //                               decoration: BoxDecoration(
        //                                 borderRadius: BorderRadius.circular(8),
        //                                 color: AppColors.primaryColor,
        //                               ),
        //                               child: const Text(
        //                                 'Add to cart',
        //                                 style: TextStyle(color: Colors.white),
        //                               ),
        //                             )
        //                           ],
        //                         )
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //               );
        //             },);
        // }

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
                title: Text(product.productName),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productCategoryName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '1 ${product.unitName}',
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
                          '৳${product.productSellingPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Container(
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
