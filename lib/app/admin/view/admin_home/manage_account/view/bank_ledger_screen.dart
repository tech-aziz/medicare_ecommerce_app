import 'package:flutter/material.dart';

class BankLedgerScreen extends StatefulWidget {
  @override
  _BankLedgerScreenState createState() => _BankLedgerScreenState();
}

class _BankLedgerScreenState extends State<BankLedgerScreen> {
  String? _selectedTransactionType;
  DateTime? _fromDate;
  DateTime? _toDate;
  List<Map<String, dynamic>> _transactions = List.generate(
    20,
    (index) => {
      'date': DateTime.now().subtract(Duration(days: index)),
      'transactionType': index % 2 == 0 ? 'Deposit' : 'Withdrawal',
      'amount': (index + 1) * 100.0,
      'description': 'Transaction ${index + 1}',
    },
  );

  List<Map<String, dynamic>> _filteredTransactions = [];

  // Method to filter the transactions based on the selected criteria
  void _filterTransactions() {
    setState(() {
      _filteredTransactions = _transactions.where((transaction) {
        bool matchesType = _selectedTransactionType == null ||
            transaction['transactionType'] == _selectedTransactionType;
        bool matchesFromDate = _fromDate == null ||
            transaction['date'].isAfter(_fromDate!.subtract(Duration(days: 1)));
        bool matchesToDate = _toDate == null ||
            transaction['date'].isBefore(_toDate!.add(Duration(days: 1)));
        return matchesType && matchesFromDate && matchesToDate;
      }).toList();
    });
  }

  // Date picker for selecting "From Date"
  Future<void> _selectFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fromDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _fromDate) {
      setState(() {
        _fromDate = picked;
      });
    }
  }

  // Date picker for selecting "To Date"
  Future<void> _selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _toDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _toDate) {
      setState(() {
        _toDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Transaction Report'),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Transaction Type Dropdown
            DropdownButtonFormField<String>(
              value: _selectedTransactionType,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedTransactionType = newValue;
                });
              },
              items: ['Account 1', 'Account 2']
                  .map((type) => DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      ))
                  .toList(),
              decoration: InputDecoration(
                labelText: 'Account Type',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // From Date Picker
            Row(
              children: [
                Expanded(
                  child: TextField(
                    readOnly: true,
                    onTap: () => _selectFromDate(context),
                    decoration: InputDecoration(
                      labelText: 'From Date',
                      hintText: _fromDate == null
                          ? 'Select From Date'
                          : '${_fromDate!.day}/${_fromDate!.month}/${_fromDate!.year}',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),

                // To Date Picker
                Expanded(
                  child: TextField(
                    readOnly: true,
                    onTap: () => _selectToDate(context),
                    decoration: InputDecoration(
                      labelText: 'To Date',
                      hintText: _toDate == null
                          ? 'Select To Date'
                          : '${_toDate!.day}/${_toDate!.month}/${_toDate!.year}',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Search Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _filterTransactions,
                child: Text('Search'),
              ),
            ),
            SizedBox(height: 20),
            Text("No recrod founs!")
            // Report Table
            // Expanded(
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: DataTable(
            //       columns: const [
            //         DataColumn(label: Text('Date')),
            //         DataColumn(label: Text('Transaction Type')),
            //         DataColumn(label: Text('Amount')),
            //         DataColumn(label: Text('Description')),
            //       ],
            //       rows: _filteredTransactions.map((transaction) {
            //         return DataRow(
            //           cells: [
            //             DataCell(Text(
            //                 '${transaction['date'].day}/${transaction['date'].month}/${transaction['date'].year}')),
            //             DataCell(Text(transaction['transactionType'])),
            //             DataCell(
            //                 Text(transaction['amount'].toStringAsFixed(2))),
            //             DataCell(Text(transaction['description'])),
            //           ],
            //         );
            //       }).toList(),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
