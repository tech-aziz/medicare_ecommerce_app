import 'package:flutter/material.dart';

class PurchaseReuturnList extends StatelessWidget {
  const PurchaseReuturnList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice Selection'),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Invoice No Label
            const Text(
              'Invoice No',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Dropdown for Invoice No
            DropdownButtonFormField<String>(
              items: [
                DropdownMenuItem(value: 'INV001', child: Text('INV001')),
                DropdownMenuItem(value: 'INV002', child: Text('INV002')),
                DropdownMenuItem(value: 'INV003', child: Text('INV003')),
              ],
              onChanged: (value) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              ),
            ),
            const SizedBox(height: 16),

            // View Button
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                ),
                child: const Text('View'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
