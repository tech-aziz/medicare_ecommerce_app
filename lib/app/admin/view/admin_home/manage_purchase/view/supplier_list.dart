import 'package:flutter/material.dart';

class SupplierList extends StatelessWidget {
  const SupplierList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Re Order List"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text("no record found"),
      ),
    );
  }
}
