import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BankTransactionScreen extends StatefulWidget {
  @override
  _BankTransactionScreenState createState() => _BankTransactionScreenState();
}

class _BankTransactionScreenState extends State<BankTransactionScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  String _selectedAccount = 'Select Account';
  String _selectedTransactionType = 'Select Transaction Type';

  List<Map<String, dynamic>> _transactions = [
    {
      'transactionDate': '12/09/2024',
      'accountName': 'John Doe',
      'accountNumber': '1234567890',
      'bankName': 'Bank A',
      'transactionType': 'Deposit',
      'note': 'Monthly Savings',
      'amount': '1000.00',
      'savedBy': 'Admin'
    },
    {
      'transactionDate': '10/09/2024',
      'accountName': 'Jane Smith',
      'accountNumber': '0987654321',
      'bankName': 'Bank B',
      'transactionType': 'Withdrawal',
      'note': 'Bill Payment',
      'amount': '500.00',
      'savedBy': 'User1'
    },
  ];

  final List<String> _accounts = [
    'Select Account',
    'John Doe',
    'Jane Smith',
    'ABC Corp'
  ];
  final List<String> _transactionTypes = [
    'Select Transaction Type',
    'Deposit',
    'Withdrawal',
    'Transfer'
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
    if (_selectedAccount != 'Select Account' &&
        _selectedTransactionType != 'Select Transaction Type' &&
        _amountController.text.isNotEmpty) {
      setState(() {
        _transactions.add({
          'transactionDate': DateFormat('dd/MM/yyyy').format(_selectedDate),
          'accountName': _selectedAccount,
          'accountNumber': '111122223333', // Placeholder for account number
          'bankName': 'Bank Placeholder', // Placeholder for bank name
          'transactionType': _selectedTransactionType,
          'note': _noteController.text,
          'amount': _amountController.text,
          'savedBy': 'CurrentUser', // Placeholder for user name
        });

        // Clear fields after saving
        _selectedAccount = 'Select Account';
        _selectedTransactionType = 'Select Transaction Type';
        _amountController.clear();
        _noteController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all the required fields.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bank Transaction',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Transaction Date Picker
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Transaction Date',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                controller: TextEditingController(
                  text: DateFormat('dd/MM/yyyy').format(_selectedDate),
                ),
                onTap: () => _pickDate(context),
              ),
              SizedBox(height: 10),

              // Account Dropdown
              DropdownButtonFormField<String>(
                value: _selectedAccount,
                decoration: InputDecoration(
                  labelText: 'Account',
                  border: OutlineInputBorder(),
                ),
                items: _accounts
                    .map((account) => DropdownMenuItem(
                          value: account,
                          child: Text(account),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedAccount = value!;
                  });
                },
              ),
              SizedBox(height: 10),

              // Transaction Type Dropdown
              DropdownButtonFormField<String>(
                value: _selectedTransactionType,
                decoration: InputDecoration(
                  labelText: 'Transaction Type',
                  border: OutlineInputBorder(),
                ),
                items: _transactionTypes
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedTransactionType = value!;
                  });
                },
              ),
              SizedBox(height: 10),

              // Amount Text Field
              TextField(
                controller: _amountController,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),

              // Note Text Field
              TextField(
                controller: _noteController,
                decoration: InputDecoration(
                  labelText: 'Note',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // Save Transaction Button
              ElevatedButton(
                onPressed: _saveTransaction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Center(
                  child: Text('Save Transaction',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height: 20),

              // Transaction List Header
              Text(
                'Transaction List',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              // Transactions Table
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Transaction Date')),
                    DataColumn(label: Text('Account Name')),
                    DataColumn(label: Text('Account Number')),
                    DataColumn(label: Text('Bank Name')),
                    DataColumn(label: Text('Transaction Type')),
                    DataColumn(label: Text('Note')),
                    DataColumn(label: Text('Amount')),
                    DataColumn(label: Text('Saved By')),
                    DataColumn(label: Text('Action')),
                  ],
                  rows: _transactions.map((transaction) {
                    return DataRow(
                      cells: [
                        DataCell(Text(transaction['transactionDate'] ?? '')),
                        DataCell(Text(transaction['accountName'] ?? '')),
                        DataCell(Text(transaction['accountNumber'] ?? '')),
                        DataCell(Text(transaction['bankName'] ?? '')),
                        DataCell(Text(transaction['transactionType'] ?? '')),
                        DataCell(Text(transaction['note'] ?? '')),
                        DataCell(Text(transaction['amount'] ?? '')),
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
            ],
          ),
        ),
      ),
    );
  }
}
