import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_ecommerce_app/app/all_product/view/product_controller.dart';
import 'package:medicare_ecommerce_app/app/bottom_pages/category_body/category_body.dart';
import 'package:medicare_ecommerce_app/app/bottom_pages/category_body/category_controller.dart';
import 'package:medicare_ecommerce_app/app/cart/cart_manager.dart';
import 'package:medicare_ecommerce_app/app/res/color.dart';

import '../category_body/category_wise_product.dart';

class HomeBodyView extends StatefulWidget {
  const HomeBodyView({Key? key}) : super(key: key);

  @override
  State<HomeBodyView> createState() => _HomeBodyViewState();
}

class _HomeBodyViewState extends State<HomeBodyView> {
  final List<String> sliderImageList = [
    'https://imgscf.slidemembers.com/docs/1/1/213/free_google_slides_-_various_pills_212317.jpg',
    'https://www.slideegg.com/image/catalog/50197-medical-powerpoint-presentation.png',
    'https://www.slideegg.com/image/catalog/76274-medicine-ppt-templates-free-download.png',
    'https://imgscf.slidemembers.com/docs/1/1/194/bottle_and_pills_-_free_ppt_templates_193827.jpg',
    'https://slidesgo.net/wp-content/uploads/2021/01/Pills-On-the-leaf-Medical-PPT-Templates-1.png',
  ];
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Fetch products initially
    final productController = Get.find<ProductController>();
    productController.fetchProducts();

    // Add scroll listener
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 100) {
        productController.loadMoreProducts();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  final CompanyController companyController = Get.put(CompanyController());
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.withOpacity(0.12),
                ),
                child: Text(
                  'Place your order before dawn 5:00 to receive your item the same day.',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Carousel section
              CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  height: 210,
                ),
                items: sliderImageList.map((imageUrl) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      imageUrl,
                      height: 400,
                      width: size.width,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(child: Icon(Icons.error)),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),

              // Companies section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Companies',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Get.to(const CategoryBody());
                    },
                    child: Text(
                      'View all',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
              Obx(() {
                if (companyController.companyList.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return SizedBox(
                  height: 126,
                  child: ListView.builder(
                    itemCount: companyController.companyList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final company = companyController.companyList[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(CategoryWiseProduct(data: company.id, name : company.name));
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey.withOpacity(0.1),
                                ),
                                child: Image.asset(
                                  "assets/images/aci.png",
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              company.name,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.9),
                                fontWeight: FontWeight.w700,
                                fontSize: 14.1,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }),
              const SizedBox(height: 4),

              // Medicines section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Medicines',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View all',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),

              Obx(() {
                if (productController.productList.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return ListView.builder(
                  controller: scrollController,
                  itemCount: productController.productList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
                          leading: Image.asset(
                            'assets/images/tafnil.png',
                            fit: BoxFit.contain,
                          ),
                          title: Text(companyController
                              .getCompanyName(product.companyId.toString())),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.productName ?? 'No Name',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    product.convertionName ?? 'N/A',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.red.withOpacity(0.2),
                                    ),
                                    child: const Text(
                                      '+10% Discount',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '৳${product.productSellingPrice}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '৳100.00',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      decoration: TextDecoration.lineThrough,
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
                                          product.productName.toString());

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Added to cart successfully!'),
                                          duration: const Duration(seconds: 2),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: AppColors.primaryColor,
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
            ],
          ),
        ),
      ),
    );
  }
}
