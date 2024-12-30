import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_ecommerce_app/app/all_product/all_product_view_2.dart';
import 'package:medicare_ecommerce_app/app/all_product/view/all_product_view.dart';
import 'package:medicare_ecommerce_app/app/all_product/view/product_controller.dart';
import 'package:medicare_ecommerce_app/app/bottom_pages/banner_model.dart';
import 'package:medicare_ecommerce_app/app/bottom_pages/category_body/category_body.dart';
import 'package:medicare_ecommerce_app/app/bottom_pages/category_body/category_controller.dart';
import 'package:medicare_ecommerce_app/app/cart/cart_manager.dart';
import 'package:medicare_ecommerce_app/app/comany/company_view.dart';
import 'package:medicare_ecommerce_app/app/res/color.dart';
import 'package:http/http.dart' as http;
import '../../../utils/urls.dart';
import '../../comany/company_controller.dart';
import '../category_body/category_wise_product.dart';

class HomeBodyView extends StatefulWidget {
  const HomeBodyView({Key? key}) : super(key: key);

  @override
  State<HomeBodyView> createState() => _HomeBodyViewState();
}

class _HomeBodyViewState extends State<HomeBodyView> {
  final ScrollController scrollController = ScrollController();
  List<BannerModel> sliderImageList = [];

  fetchBanner() async {
    final response = await http.get(
      Uri.parse(AppURL.getBanner),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        sliderImageList =
            data.map((item) => BannerModel.fromJson(item)).toList();
      });
    } else {
      Get.snackbar('Error', 'Failed to fetch search results.');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchBanner();
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
                      "https://app.tophealthpharma.com/uploads/banners/${imageUrl.imageName}",
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
                      Get.to(const CompanyView());
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
                                Get.to(CategoryWiseProduct(
                                    data: company.id, name: company.name));
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey.withOpacity(0.1),
                                    image: DecorationImage(
                                      image: company.imageName == ''
                                          ? NetworkImage(
                                              "https://app.tophealthpharma.com/assets/no_image.gif",
                                            )
                                          : NetworkImage(
                                              "https://app.tophealthpharma.com/uploads/companies/${company.imageName}",
                                            ),
                                      fit: BoxFit.fill,
                                    )),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              company.name,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.9),
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
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
                    onPressed: () {
                      Get.to(AllProductView2());
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
                          leading: product.imageName == null
                              ? Image.network(
                                  "https://app.tophealthpharma.com/assets/no_image.gif",
                                  fit: BoxFit.fill,
                                )
                              : Image.network(
                                  "https://app.tophealthpharma.com/uploads/products/${product.imageName}",
                                  fit: BoxFit.fill,
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
                                  product.discount == "0"
                                      ? SizedBox.shrink()
                                      : Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: Colors.red.withOpacity(0.2),
                                          ),
                                          child: Text(
                                            '${product.discount}% Discount',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '৳${double.parse(product.productSellingPrice.toString()) * double.parse(product.perUnit.toString())}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  product.discountAmount == "0.00"
                                      ? SizedBox.shrink()
                                      : Text(
                                          '৳${product.discountAmount}',
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      CartManager().addToCart(
                                          productId: int.parse(
                                              product.productSlNo.toString()),
                                          quantity: 1,
                                          unitRate: double.parse(
                                                  product.perUnit.toString()) *
                                              double.parse(product
                                                  .productSellingPrice
                                                  .toString()),
                                          productName:
                                              product.productName.toString(),
                                          productImage:
                                              product.imageName.toString());

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
                                        color: Colors.blue,
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
