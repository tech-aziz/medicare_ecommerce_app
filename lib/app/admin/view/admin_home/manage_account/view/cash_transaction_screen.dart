import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CashTransactionScreen extends StatefulWidget {
  @override
  _CashTransactionScreenState createState() => _CashTransactionScreenState();
}

class _CashTransactionScreenState extends State<CashTransactionScreen> {
  final TextEditingController _transactionIdController =
      TextEditingController();
  final TextEditingController _transactionTypeController =
      TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  // Adding demo data
  List<Map<String, dynamic>> _transactions = [
    {
      'transactionId': 'T001',
      'accountName': 'John Doe',
      'date': '12/09/2024',
      'description': 'Payment for invoice #123',
      'receivedAmount': '500.00',
      'paidAmount': '0.00',
      'savedBy': 'Admin'
    },
    {
      'transactionId': 'T002',
      'accountName': 'Jane Smith',
      'date': '10/09/2024',
      'description': 'Refund for order #456',
      'receivedAmount': '0.00',
      'paidAmount': '200.00',
      'savedBy': 'Admin'
    },
    {
      'transactionId': 'T003',
      'accountName': 'ABC Corp',
      'date': '11/09/2024',
      'description': 'Advance payment',
      'receivedAmount': '1000.00',
      'paidAmount': '0.00',
      'savedBy': 'User1'
    },
  ];

  void _pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _saveTransaction() {
    setState(() {
      _transactions.add({
        'transactionId': _transactionIdController.text,
        'accountName': _accountController.text,
        'date': DateFormat('dd/MM/yyyy').format(_selectedDate),
        'description': _descriptionController.text,
        'receivedAmount': _amountController.text,
        'paidAmount': '0.00', // Placeholder for paid amount
        'savedBy': 'User', // Placeholder for saved by
      });

      // Clear fields after saving
      _transactionIdController.clear();
      _transactionTypeController.clear();
      _accountController.clear();
      _descriptionController.clear();
      _amountController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cash Transaction',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  TextField(
                    controller: _transactionIdController,
                    decoration: InputDecoration(
                      labelText: 'Transaction ID',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _transactionTypeController,
                    decoration: InputDecoration(
                      labelText: 'Transaction Type',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: TextField(
                      controller: _accountController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            // Handle add account action
                          },
                          icon: Icon(Icons.add_circle, color: Colors.blue),
                        ),
                        labelText: 'Account Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText:
                                DateFormat('dd/MM/yyyy').format(_selectedDate),
                            border: OutlineInputBorder(),
                          ),
                          onTap: () => _pickDate(context),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _amountController,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: _saveTransaction,
                          child: Text('Save',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () {
                            // Clear all fields
                            _transactionIdController.clear();
                            _transactionTypeController.clear();
                            _accountController.clear();
                            _descriptionController.clear();
                            _amountController.clear();
                          },
                          child: Text('Cancel',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Transaction ID')),
                      DataColumn(label: Text('Account Name')),
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('Description')),
                      DataColumn(label: Text('Received Amount')),
                      DataColumn(label: Text('Paid Amount')),
                      DataColumn(label: Text('Saved By')),
                      DataColumn(label: Text('Action')),
                    ],
                    rows: _transactions.map((transaction) {
                      return DataRow(
                        cells: [
                          DataCell(Text(transaction['transactionId'] ?? '')),
                          DataCell(Text(transaction['accountName'] ?? '')),
                          DataCell(Text(transaction['date'] ?? '')),
                          DataCell(Text(transaction['description'] ?? '')),
                          DataCell(Text(transaction['receivedAmount'] ?? '')),
                          DataCell(Text(transaction['paidAmount'] ?? '')),
                          DataCell(Text(transaction['savedBy'] ?? '')),
                          DataCell(
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  _transactions.remove(transaction);
                                });
                              },
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
