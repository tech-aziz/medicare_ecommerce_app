import 'package:flutter/material.dart';

class ReOrderList extends StatefulWidget {
  const ReOrderList({super.key});

  @override
  State<ReOrderList> createState() => _ReOrderListState();
}

class _ReOrderListState extends State<ReOrderList> {
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
