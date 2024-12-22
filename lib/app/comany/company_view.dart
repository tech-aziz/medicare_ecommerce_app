import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_ecommerce_app/app/bottom_pages/category_body/category_controller.dart';
import 'package:medicare_ecommerce_app/app/bottom_pages/category_body/category_wise_product.dart';

import 'company_controller.dart';
import 'company_wise_product.dart';

class CompanyView extends StatefulWidget {
  const CompanyView({super.key});

  @override
  State<CompanyView> createState() => _CompanyViewState();
}

class _CompanyViewState extends State<CompanyView> {
  final CompanyController companyController = Get.find<CompanyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Company'),
      ),
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
              return InkWell(
                onTap: () {
                  Get.to(CompanyWiseProduct(
                    data: company.id,
                    name: company.name,
                  ));
                },
                child: Card(
                  elevation: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Default image logic
                      company.imageName == null || company.imageName == ''
                          ? Image.network(
                              "https://app.tophealthpharma.com/assets/no_image.gif",
                              height: 60,
                              width: 60,
                            )
                          : Image.network(
                              "https://app.tophealthpharma.com/uploads/companies/${company.imageName}",
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
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
