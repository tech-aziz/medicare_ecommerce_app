import 'package:flutter/material.dart';

class CashPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cash Payment'),
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
                    onPressed: () {},
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

              // Cash In, Cash Out, Balance Row
              _buildCashRow(
                icon: Icons.arrow_downward,
                text: 'Cash In',
                color: Colors.green,
                value: 'BDT 0.00',
              ),
              SizedBox(
                height: 10,
              ),
              _buildCashRow(
                icon: Icons.arrow_upward,
                text: 'Cash Out',
                color: Colors.red,
                value: 'BDT 0.00',
              ),
              SizedBox(
                height: 10,
              ),  
              _buildCashRow(
                icon: Icons.account_balance,
                text: 'Balance',
                color: Colors.blue,
                value: 'BDT 0.00',
              ),
              SizedBox(height: 20),

              // Sections with Tables
              _buildSection(context, 'Sales',
                  ['Invoice', 'Date', 'Customer', 'Received']),
              _buildSection(context, 'Received From Customers',
                  ['Invoice', 'Date', 'Customer', 'Received']),
              _buildSection(context, 'Received From Suppliers',
                  ['Invoice', 'Date', 'Supplier', 'Received']),
              _buildSection(context, 'Cash Received',
                  ['Transaction ID', 'Date', 'Account Name', 'Received']),
              _buildSection(context, 'Bank Withdraw', [
                'SL',
                'Account Name',
                'Account Number',
                'Bank Name',
                'Date',
                'Withdraw'
              ]),
              _buildSection(context, 'Loan Received', [
                'SL',
                'Account Name',
                'Account Number',
                'Bank Name',
                'Date',
                'Withdraw'
              ]),
              _buildSection(context, 'Invest Received',
                  ['SL', 'Account Name', 'Date', 'Received']),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build a cash row
  Widget _buildCashRow({
    required IconData icon,
    required String text,
    required Color color,
    required String value,
  }) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(icon, color: color),
                SizedBox(width: 10),
                Text(
                  text,
                  style: TextStyle(color: color, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10),
        Text(
          value,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  // Helper method to build sections with a table
  Widget _buildSection(
      BuildContext context, String title, List<String> columns) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), // Border around the table
            borderRadius: BorderRadius.circular(8),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: MaterialStateProperty.all(Colors.grey[300]),
              columns: columns
                  .map((column) => DataColumn(label: Text(column)))
                  .toList(),
              rows: [
                // Demo row
                DataRow(
                  cells: columns
                      .map((column) => DataCell(Text(
                          column == 'Received' || column == 'Withdraw'
                              ? '0.00'
                              : '')))
                      .toList(),
                ),
                // Total row
                DataRow(
                  cells: columns.map((column) {
                    if (column == 'Received' || column == 'Withdraw') {
                      return DataCell(Text('0.00',
                          style: TextStyle(fontWeight: FontWeight.bold)));
                    } else if (column == 'Customer' ||
                        column == 'Account Name') {
                      return DataCell(Text('Total',
                          style: TextStyle(fontWeight: FontWeight.bold)));
                    } else {
                      return DataCell(Text(''));
                    }
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
