import 'package:flutter/material.dart';

class PurchaseRecord extends StatelessWidget {
  const PurchaseRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Type Selection'),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Type Label
            const Text(
              'Search Type',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Dropdown for Search Type
            DropdownButtonFormField<String>(
              items: [
                DropdownMenuItem(value: 'All', child: Text('All')),
                DropdownMenuItem(value: 'By Supplier', child: Text('By Supplier')),
                DropdownMenuItem(value: 'By Category', child: Text('By Category')),
                DropdownMenuItem(value: 'By Quantity', child: Text('By Quantity')),
                DropdownMenuItem(value: 'By User', child: Text('By User')),
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

            // Record Type Label
            const Text(
              'Record Type',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Dropdown for Record Type
            DropdownButtonFormField<String>(
              items: [
                DropdownMenuItem(value: 'Type 1', child: Text('Type 1')),
                DropdownMenuItem(value: 'Type 2', child: Text('Type 2')),
                DropdownMenuItem(value: 'Type 3', child: Text('Type 3')),
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

            // Date Picker Field
            const Text(
              'Select Date',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () {
                    // Add date picker logic here
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              ),
            ),
            const SizedBox(height: 16),

            // Search Button
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                ),
                child: const Text('Search'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
