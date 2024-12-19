import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_ecommerce_app/app/bottom_pages/category_body/category_controller.dart';

class CategoryBody extends StatefulWidget {
  const CategoryBody({super.key});

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {

  final CompanyController companyController = Get.find<CompanyController>();

 
  
  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: 
        // GridView.builder(
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //     crossAxisSpacing: 8.0,
        //     mainAxisSpacing: 8.0,
        //   ),
        //   itemCount: companyList.length,
        //   itemBuilder: (context, index) {
        //     return Card(
        //       elevation: 4,
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Image.asset(
        //             companyList[index]['img']!,
        //             height: 60,
        //             width: 60,
        //           ),
        //           SizedBox(height: 8),
        //           Text(
        //             companyList[index]['name']!,
        //             style: TextStyle(
        //               fontWeight: FontWeight.bold,
        //               fontSize: 16,
        //             ),
        //           ),
        //         ],
        //       ),
        //     );
        //   },
        // ),
        Obx(() {
          if (companyController.companyList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: companyController.companyList.length,
            itemBuilder: (context, index) {
              final company = companyController.companyList[index];
              return Card(
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Default image logic
                    Image.asset(
                      companyController.defaultImage,
                      height: 60,
                      width: 60,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      company.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
