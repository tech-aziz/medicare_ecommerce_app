import 'package:flutter/material.dart';

import 'view/asset_entry.dart';
import 'view/purchase_invoice.dart';
import 'view/purchase_record.dart';
import 'view/purchase_return.dart';
import 'view/purchase_return_details.dart';
import 'view/purchase_reuturn_list.dart';
import 'view/purchase_view.dart';
import 'view/re_order_list.dart';
import 'view/suppiler_due_report.dart';
import 'view/suppiler_payment.dart';
import 'view/supplier_list.dart';

class ManagePurchase extends StatelessWidget {
  const ManagePurchase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of items for the grid view
    List<Map<String, dynamic>> gridItems = [
      {
        'name': 'Purchase View',
        'icon': Icons.shopping_cart,
        'route': PurchaseView()
      },
      {
        'name': 'Purchase Return',
        'icon': Icons.assignment_return,
        'route': PurchaseReuturnList(),
      },
      {
        'name': 'Purchase Record',
        'icon': Icons.receipt,
        'route': PurchaseRecord(),
      },
      {
        'name': 'Asset Entry',
        'icon': Icons.account_balance,
        'route': AssetEntry(),
      },
      {
        'name': 'Purchase Invoice',
        'icon': Icons.description,
        'route': PurchaseInvoice()
      },
      {
        'name': 'Supplier Due Report',
        'icon': Icons.report,
        'route': SuppilerDueReport(),
      },
      {
        'name': 'Supplier Payment Report',
        'icon': Icons.payment,
        'route': SuppilerPayment(),
      },
      {'name': 'Supplier List', 'icon': Icons.list, 'route': SupplierList()},
      {
        'name': 'Purchase Return List',
        'icon': Icons.assignment,
        'route': PurchaseReturn(),
      },
      {
        'name': 'Purchase Return Details',
        'icon': Icons.details,
        'route': PurchaseReturnDetails()
      },
      {'name': 'Re-Order List', 'icon': Icons.reorder, 'route': ReOrderList()},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Purchase'),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 3 / 2,
          ),
          itemCount: gridItems.length,
          itemBuilder: (context, index) {
            final item = gridItems[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => item['route']));
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item['icon'], size: 40, color: Colors.blue[700]),
                    const SizedBox(height: 10),
                    Text(
                      item['name'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
