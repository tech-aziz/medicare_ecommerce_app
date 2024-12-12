import 'package:flutter/material.dart';



class PurchaseInvoice extends StatefulWidget {
  @override
  _PurchaseInvoiceState createState() => _PurchaseInvoiceState();
}

class _PurchaseInvoiceState extends State<PurchaseInvoice> {
  String? selectedInvoice;
  final List<String> invoiceOptions = ['INV001', 'INV002', 'INV003', 'INV004'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Invoice Screen')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Invoice Number:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedInvoice,
              hint: Text('Select Invoice'),
              onChanged: (newValue) {
                setState(() {
                  selectedInvoice = newValue;
                });
              },
              items: invoiceOptions.map((invoice) {
                return DropdownMenuItem<String>(
                  value: invoice,
                  child: Text(invoice),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            if (selectedInvoice != null)
              Text(
                'Selected Invoice: $selectedInvoice',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
