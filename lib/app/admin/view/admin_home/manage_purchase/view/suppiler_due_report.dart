import 'package:flutter/material.dart';

class SuppilerDueReport extends StatefulWidget {
  @override
  _SuppilerDueReportState createState() => _SuppilerDueReportState();
}

class _SuppilerDueReportState extends State<SuppilerDueReport> {
  String? selectedSearchType;
  String? reportResult;
  final List<String> searchTypes = ['Type 1', 'Type 2', 'Type 3', 'Type 4'];

  void generateReport() {
    setState(() {
      // Simulate generating a report based on selected search type
      reportResult = 'Report for $selectedSearchType';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Report')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search Type:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedSearchType,
              hint: Text('Select Search Type'),
              onChanged: (newValue) {
                setState(() {
                  selectedSearchType = newValue;
                });
              },
              items: searchTypes.map((type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectedSearchType != null ? generateReport : null,
              child: Text('Show Report'),
            ),
            SizedBox(height: 20),
            if (reportResult != null)
              Text(
                'Report: $reportResult',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
