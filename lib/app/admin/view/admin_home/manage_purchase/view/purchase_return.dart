import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class PurchaseReturn extends StatefulWidget {
  @override
  _PurchaseReturnState createState() => _PurchaseReturnState();
}

class _PurchaseReturnState extends State<PurchaseReturn> {
  String? selectedSupplier;
  DateTime? dateFrom;
  DateTime? dateTo;

  final List<String> suppliers = ['Supplier 1', 'Supplier 2', 'Supplier 3', 'Supplier 4'];

  // Function to show date picker
  Future<void> _selectDate(BuildContext context, {required bool isFromDate}) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ) ?? DateTime.now();

    setState(() {
      if (isFromDate) {
        dateFrom = picked;
      } else {
        dateTo = picked;
      }
    });
  }

  String formatDate(DateTime? date) {
    if (date == null) {
      return '';
    }
    return DateFormat('MM/dd/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filter Screen')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Supplier Dropdown
            Text(
              'Supplier:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedSupplier,
              hint: Text('Select Supplier'),
              onChanged: (newValue) {
                setState(() {
                  selectedSupplier = newValue;
                });
              },
              items: suppliers.map((supplier) {
                return DropdownMenuItem<String>(
                  value: supplier,
                  child: Text(supplier),
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            // Date From
            Text(
              'Date From:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              readOnly: true,
              controller: TextEditingController(text: formatDate(dateFrom)),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context, isFromDate: true),
                ),
                hintText: '12/12/2024',
                labelText: 'Date From',
              ),
            ),
            SizedBox(height: 20),

            // Date To
            Text(
              'Date To:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              readOnly: true,
              controller: TextEditingController(text: formatDate(dateTo)),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context, isFromDate: false),
                ),
                hintText: '12/12/2024',
                labelText: 'Date To',
              ),
            ),
            SizedBox(height: 20),

            // Show Button
            ElevatedButton(
              onPressed: () {
                if (selectedSupplier != null && dateFrom != null && dateTo != null) {
                  // Show report logic or action here
                  print('Showing report for $selectedSupplier from $dateFrom to $dateTo');
                }
              },
              child: Text('Show'),
            ),
          ],
        ),
      ),
    );
  }
}
