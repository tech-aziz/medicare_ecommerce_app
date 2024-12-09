import 'package:flutter/material.dart';

class TransactionAccountScreen extends StatefulWidget {
  @override
  _TransactionAccountScreenState createState() =>
      _TransactionAccountScreenState();
}

class _TransactionAccountScreenState extends State<TransactionAccountScreen> {
  final TextEditingController _accountIdController = TextEditingController();
  final TextEditingController _accountNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  List<Map<String, dynamic>> _accounts = [
    {
      'accountId': '001',
      'accountName': 'Cash Account',
      'description': 'Primary cash account',
    },
    {
      'accountId': '002',
      'accountName': 'Bank Account',
      'description': 'Main bank account',
    },
  ];

  void _saveAccount() {
    if (_accountIdController.text.isNotEmpty &&
        _accountNameController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      setState(() {
        _accounts.add({
          'accountId': _accountIdController.text,
          'accountName': _accountNameController.text,
          'description': _descriptionController.text,
        });

        // Clear fields after saving
        _accountIdController.clear();
        _accountNameController.clear();
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
        title: Text('Transaction Account'),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account ID Text Field
            TextField(
              controller: _accountIdController,
              decoration: InputDecoration(
                labelText: 'Account ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // Account Name Text Field
            TextField(
              controller: _accountNameController,
              decoration: InputDecoration(
                labelText: 'Account Name',
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
                  DataColumn(label: Text('Account ID')),
                  DataColumn(label: Text('Account Name')),
                  DataColumn(label: Text('Description')),
                  DataColumn(label: Text('Action')),
                ],
                rows: _accounts.map((account) {
                  return DataRow(
                    cells: [
                      DataCell(Text(account['accountId'] ?? '')),
                      DataCell(Text(account['accountName'] ?? '')),
                      DataCell(Text(account['description'] ?? '')),
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
