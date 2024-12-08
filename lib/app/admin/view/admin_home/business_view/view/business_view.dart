
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class BusinessView extends StatefulWidget {
  const BusinessView({super.key});

  @override
  State<BusinessView> createState() => _BusinessViewState();
}

class _BusinessViewState extends State<BusinessView> {
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
          'Graph',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.normal),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 3, // Number of columns
          crossAxisSpacing: 8, // Spacing between columns
          mainAxisSpacing: 8, // Spacing between rows
          childAspectRatio: 1, // Adjust to control the shape of grid items
          children: [
            buildGridItem(Icons.shopping_cart, "Today's Sale", 'BDT 0.00', Colors.blue),
            buildGridItem(Icons.attach_money, 'Collection', 'BDT 0.00', Colors.brown),
            buildGridItem(Icons.shop, 'Monthly Sale', 'BDT 0.00', Colors.green),
            buildGridItem(Icons.arrow_back, 'Customer Due', 'BDT 0.00', Colors.orange),
            buildGridItem(Icons.money, 'Cash Balance', 'BDT 0.00', Colors.red),
            buildGridItem(Icons.account_balance, 'Bank Balance', 'BDT 0.00', Colors.brown.shade700),
            buildGridItem(Icons.inventory, 'Stock Value', 'BDT 0.00', Colors.blue),
            buildGridItem(Icons.account_balance_wallet, 'Asset Value', 'BDT 0.00', Colors.brown),
            buildGridItem(Icons.assignment_return, 'Supplier Due', 'BDT 0.00', Colors.green),
            buildGridItem(Icons.trending_up, 'Monthly Profit', 'BDT 0.00', Colors.brown),
            buildGridItem(Icons.money_off, 'Loan Balance', 'BDT 0.00', Colors.red),
            buildGridItem(Icons.account_balance_wallet_outlined, 'Invest Balance', 'BDT 0.00', Colors.orange),
          ],
        ),
      ),
    );
  }
}


Widget buildGridItem(IconData icon, String title, String value, Color color) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 3), // Shadow position
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 20,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    ),
  );
}


