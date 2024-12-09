import 'package:flutter/material.dart';

class BankAccountScreen extends StatefulWidget {
  @override
  _BankAccountScreenState createState() => _BankAccountScreenState();
}

class _BankAccountScreenState extends State<BankAccountScreen> {
  final TextEditingController _accountNameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _accountTypeController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _branchNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  List<Map<String, dynamic>> _accounts = [
    {
      'accountName': 'Savings Account',
      'accountNumber': '123456789',
      'accountType': 'Savings',
      'bankName': 'ABC Bank',
      'branchName': 'Main Branch',
      'status': 'Active',
    },
    {
      'accountName': 'Business Account',
      'accountNumber': '987654321',
      'accountType': 'Business',
      'bankName': 'XYZ Bank',
      'branchName': 'Downtown Branch',
      'status': 'Active',
    },
  ];

  void _saveAccount() {
    if (_accountNameController.text.isNotEmpty &&
        _accountNumberController.text.isNotEmpty &&
        _accountTypeController.text.isNotEmpty &&
        _bankNameController.text.isNotEmpty &&
        _branchNameController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      setState(() {
        _accounts.add({
          'accountName': _accountNameController.text,
          'accountNumber': _accountNumberController.text,
          'accountType': _accountTypeController.text,
          'bankName': _bankNameController.text,
          'branchName': _branchNameController.text,
          'status': 'Active', // Default status is Active
        });

        // Clear fields after saving
        _accountNameController.clear();
        _accountNumberController.clear();
        _accountTypeController.clear();
        _bankNameController.clear();
        _branchNameController.clear();
        _descriptionController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all the fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Account'),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account Name Text Field
            TextField(
              controller: _accountNameController,
              decoration: InputDecoration(
                labelText: 'Account Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // Account Number Text Field
            TextField(
              controller: _accountNumberController,
              decoration: InputDecoration(
                labelText: 'Account Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // Account Type Text Field
            TextField(
              controller: _accountTypeController,
              decoration: InputDecoration(
                labelText: 'Account Type',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // Bank Name Text Field
            TextField(
              controller: _bankNameController,
              decoration: InputDecoration(
                labelText: 'Bank Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // Branch Name Text Field
            TextField(
              controller: _branchNameController,
              decoration: InputDecoration(
                labelText: 'Branch Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // Description Text Field
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Save Button
            ElevatedButton(
              onPressed: _saveAccount,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child:
                  Text('Save Account', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),

            // Account List Table
            Text(
              'Account List',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Account Name')),
                  DataColumn(label: Text('Account Number')),
                  DataColumn(label: Text('Account Type')),
                  DataColumn(label: Text('Bank Name')),
                  DataColumn(label: Text('Branch Name')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Action')),
                ],
                rows: _accounts.map((account) {
                  return DataRow(
                    cells: [
                      DataCell(Text(account['accountName'] ?? '')),
                      DataCell(Text(account['accountNumber'] ?? '')),
                      DataCell(Text(account['accountType'] ?? '')),
                      DataCell(Text(account['bankName'] ?? '')),
                      DataCell(Text(account['branchName'] ?? '')),
                      DataCell(Text(account['status'] ?? '')),
                      DataCell(
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _accounts.remove(account);
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
    );
  }
}
