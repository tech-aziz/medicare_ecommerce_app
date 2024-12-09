import 'package:flutter/material.dart';

class BalanceInOutScreen extends StatefulWidget {
  @override
  _BalanceInOutScreenState createState() => _BalanceInOutScreenState();
}

class _BalanceInOutScreenState extends State<BalanceInOutScreen> {
  bool _isSearchClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Balance In-Out'),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date Pickers and Search Button
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'From Date',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'To Date',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isSearchClicked = true;
                      });
                    },
                    child: Text('Search'),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Divider
              Divider(),

              // Print Button
              Row(
                children: [
                  Icon(Icons.print, color: Colors.blue),
                  SizedBox(width: 8),
                  Text('Print', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 20),

              // Tables shown after search
              if (_isSearchClicked) ...[
                _buildCashInTable(),
                SizedBox(height: 20),
                _buildCashOutTable(),
                SizedBox(height: 20),

                // Cash Balance
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Cash Balance: BDT 0.00',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build the Cash In Table
  Widget _buildCashInTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cash In',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 10),
        _buildTable(
          headers: ['Category', 'Amount'],
          rows: [
            ['Total Sales', '0.00'],
            ['Customer Payment Received', '0.00'],
            ['Cash Received', '0.00'],
            ['Withdraw From Bank', '0.00'],
            ['Loan Received', '0.00'],
            ['Invest Received', '0.00'],
            ['Supplier Payment Received', '0.00'],
            ['Asset Sales', '0.00'],
          ],
          footer: ['Total Cash In', '0.00'],
        ),
      ],
    );
  }

  // Helper method to build the Cash Out Table
  Widget _buildCashOutTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cash Out',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 10),
        _buildTable(
          headers: ['Category', 'Amount'],
          rows: [
            ['Total Purchase', '0.00'],
            ['Supplier Payment Paid', '0.00'],
            ['Cash Paid', '0.00'],
            ['Deposit to Bank', '0.00'],
            ['Loan Payment', '0.00'],
            ['Invest Payment', '0.00'],
            ['Employee', '0.00'],
            ['Customer Payment Paid', '0.00'],
            ['Assets Cost', '0.00'],
          ],
          footer: ['Total Cash Out', '0.00'],
        ),
      ],
    );
  }

  // Helper method to build a generic table
  Widget _buildTable({
    required List<String> headers,
    required List<List<String>> rows,
    required List<String> footer,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(Colors.grey[300]),
          columns:
              headers.map((header) => DataColumn(label: Text(header))).toList(),
          rows: [
            ...rows.map((row) {
              return DataRow(
                cells: row.map((cell) => DataCell(Text(cell))).toList(),
              );
            }),
            DataRow(
              cells: footer.map((cell) {
                return DataCell(
                  Text(
                    cell,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
