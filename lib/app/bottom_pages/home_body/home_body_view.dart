import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_ecommerce_app/app/bottom_pages/category_body/category_body.dart';
import 'package:medicare_ecommerce_app/app/bottom_pages/category_body/category_controller.dart';
import 'package:medicare_ecommerce_app/app/res/color.dart';

class HomeBodyView extends StatefulWidget {
  const HomeBodyView({super.key});

  @override
  State<HomeBodyView> createState() => _HomeBodyViewState();
}

class _HomeBodyViewState extends State<HomeBodyView> {
  final List<String> sliderImageList = [
    'https://imgscf.slidemembers.com/docs/1/1/213/free_google_slides_-_various_pills_212317.jpg',
    'https://www.slideegg.com/image/catalog/50197-medical-powerpoint-presentation.png',
    'https://www.slideegg.com/image/catalog/76274-medicine-ppt-templates-free-download.png',
    'https://www.slideegg.com/image/catalog/76274-medicine-ppt-templates-free-download.png',
    'https://imgscf.slidemembers.com/docs/1/1/194/bottle_and_pills_-_free_ppt_templates_193827.jpg',
    'https://slidesgo.net/wp-content/uploads/2021/01/Pills-On-the-leaf-Medical-PPT-Templates-1.png',
  ];

  final List<Map<String, dynamic>> companyList = [
    {
      'name': 'Acme Ltd.',
      'img': 'assets/images/acme.png',
    },
    {
      'name': 'Square LTd.',
      'img': 'assets/images/square.png',
    },
    {
      'name': 'Ad-din',
      'img': 'assets/images/ad-din.png',
    },
    {
      'name': 'Albion',
      'img': 'assets/images/albion.png',
    },
    {
      'name': 'Alco Pharma',
      'img': 'assets/images/alco_pharma.png',
    },
    {
      'name': 'Ambee',
      'img': 'assets/images/ambee.png',
    },
    {
      'name': 'AMICO',
      'img': 'assets/images/amico.png',
    },
    {
      'name': 'Amulet',
      'img': 'assets/images/amulet.png',
    },
    {
      'name': 'APC',
      'img': 'assets/images/apc.png',
    },
  ];

  final CompanyController companyController = Get.put(CompanyController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.withOpacity(0.12),
                ),
                child: Text(
                  'Place your order before dawn 5:00 to receive your item the same day .',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              //carousel section start
              CarouselSlider(
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                    reverse: false,
                    height: 210),
                items: sliderImageList
                    .map((e) => ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            e,
                            height: 400,
                            width: size.width,
                            fit: BoxFit.cover,
                          ),
                        ))
                    .toList(),
              ),
              //carousel section start
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Companies',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  IconButton(
                      onPressed: () {
                        //Get.to(const CategoryBody());
                      },
                      icon: Text('View all',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17)))
                ],
              ),

              // SizedBox(
              //   height: 126,
              //   child: ListView.builder(
              //     itemCount: companyList.length,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) {
              //       final data = companyList[index];
              //       return Padding(
              //         padding: const EdgeInsets.only(right: 12),
              //         child: Column(
              //           children: [
              //             Container(
              //               padding: const EdgeInsets.symmetric(horizontal: 15),
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(12),
              //                 color: Colors.grey.withOpacity(0.1),
              //               ),
              //               child: Image.asset(
              //                 data['img'],
              //                 height: 100,
              //                 width: 100,
              //                 fit: BoxFit.contain,
              //               ),
              //             ),
              //             const SizedBox(
              //               height: 6,
              //             ),
              //             Text(
              //               data['name'].toString(),
              //               style: TextStyle(
              //                   color: Colors.black.withOpacity(0.9),
              //                   fontWeight: FontWeight.w700,
              //                   fontSize: 14.1),
              //             )
              //           ],
              //         ),
              //       );
              //     },
              //   ),
              // ),
              

              ////===ak code
              Obx(() {
                if (companyController.companyList.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
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
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey.withOpacity(0.1),
                                ),
                                child: Image.asset(
                                  companyController.defaultImage,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.contain,
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
                    ));
              }),

              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Medicines',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Text('View all',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17)))
                ],
              ),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.withOpacity(0.1)),
                      child: ListTile(
                        leading: Image.asset('assets/images/tafnil.png',
                            fit: BoxFit.contain),
                        title: const Text('Eskayef Pharmaceuticals Ltd.'),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Tufnil Tablet- (200mg)',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  '1 pcs',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.normal),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
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
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  '৳90.00',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '100.00',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.primaryColor,
                                  ),
                                  child: const Text(
                                    'Add to cart',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
