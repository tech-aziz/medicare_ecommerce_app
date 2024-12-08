import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'business_view/view/business_view.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Admin',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.normal),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            GridView.count(
              shrinkWrap: true,
              primary: false,
              crossAxisCount: 2, // Number of items per row
              crossAxisSpacing: 16, // Horizontal spacing between items
              mainAxisSpacing: 16, // Vertical spacing between items
              children: [
                buildGridItem(icon: Icons.shopping_cart, label: 'Manage Sales', bgColor: const Color(0xffD2D2FF)),
                buildGridItem(icon: Icons.shop, label: 'Manage Purchase', bgColor: const Color(0xffBDECD7)),
                buildGridItem(icon: Icons.account_balance, label: 'Manage Accounts', bgColor: const Color(0xff85E6FA)),
                
                
                GestureDetector(
                  onTap: () {
                    Get.to(()=> const BusinessView());
                  },
                    child: buildGridItem(icon: Icons.bar_chart, label: 'Business View', bgColor: const Color(0xffBDDDDD))),

              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridItem({required IconData icon, required String label, required Color bgColor}) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.blue,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
  
}
