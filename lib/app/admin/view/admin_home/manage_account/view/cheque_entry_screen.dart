import 'package:flutter/material.dart';

class ChequeEntryScreen extends StatefulWidget {
  @override
  _ChequeEntryScreenState createState() => _ChequeEntryScreenState();
}

class _ChequeEntryScreenState extends State<ChequeEntryScreen> {
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _branchNameController = TextEditingController();
  final TextEditingController _chequeNoController = TextEditingController();
  final TextEditingController _chequeAmountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _reminderDateController = TextEditingController();
  final TextEditingController _submitDateController = TextEditingController();
  final TextEditingController _chequeDateController = TextEditingController();

  String? _selectedCustomer;
  List<String> _customers = ['Customer A', 'Customer B', 'Customer C'];

  List<Map<String, dynamic>> _cheques = [
    {
      'chequeDate': '12/09/2024',
      'chequeNo': '12345',
      'bankNameBranch': 'ABC Bank - Main Branch',
      'customerName': 'Customer A',
      'chequeStatus': 'Pending',
      'chequeAmount': '5000',
    },
    {
      'chequeDate': '15/09/2024',
      'chequeNo': '67890',
      'bankNameBranch': 'XYZ Bank - Downtown Branch',
      'customerName': 'Customer B',
      'chequeStatus': 'Cleared',
      'chequeAmount': '2000',
    },
  ];

  void _submitCheque() {
    if (_selectedCustomer != null &&
        _bankNameController.text.isNotEmpty &&
        _branchNameController.text.isNotEmpty &&
        _chequeNoController.text.isNotEmpty &&
        _chequeAmountController.text.isNotEmpty &&
        _chequeDateController.text.isNotEmpty &&
        _reminderDateController.text.isNotEmpty &&
        _submitDateController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      setState(() {
        _cheques.add({
          'chequeDate': _chequeDateController.text,
          'chequeNo': _chequeNoController.text,
          'bankNameBranch':
              '${_bankNameController.text} - ${_branchNameController.text}',
          'customerName': _selectedCustomer!,
          'chequeStatus': 'Pending',
          'chequeAmount': _chequeAmountController.text,
        });

        // Clear fields after submitting
        _selectedCustomer = null;
        _bankNameController.clear();
        _branchNameController.clear();
        _chequeNoController.clear();
        _chequeAmountController.clear();
        _chequeDateController.clear();
        _reminderDateController.clear();
        _submitDateController.clear();
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
        title: Text('Cheque Entry'),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Customer Dropdown
              Text('Select Customer'),
              DropdownButton<String>(
                value: _selectedCustomer,
                hint: Text('Select Customer'),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCustomer = newValue;
                  });
                },
                items: _customers.map((String customer) {
                  return DropdownMenuItem<String>(
                    value: customer,
                    child: Text(customer),
                  );
                }).toList(),
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

              // Cheque No Text Field
              TextField(
                controller: _chequeNoController,
                decoration: InputDecoration(
                  labelText: 'Cheque No',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // Cheque Amount Text Field
              TextField(
                controller: _chequeAmountController,
                decoration: InputDecoration(
                  labelText: 'Cheque Amount',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // Date (Cheque Date) Text Field
              TextField(
                controller: _chequeDateController,
                decoration: InputDecoration(
                  labelText: 'Cheque Date (dd/mm/yyyy)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // Reminder Date Text Field
              TextField(
                controller: _reminderDateController,
                decoration: InputDecoration(
                  labelText: 'Reminder Date (dd/mm/yyyy)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // Submit Date Text Field
              TextField(
                controller: _submitDateController,
                decoration: InputDecoration(
                  labelText: 'Submit Date (dd/mm/yyyy)',
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

              // Submit Button
              ElevatedButton(
                onPressed: _submitCheque,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text('Submit', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 20),

              // Cheque Information List Table
              Text(
                'Cheque Information List',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Cheque Date')),
                    DataColumn(label: Text('Cheque No')),
                    DataColumn(label: Text('Bank Name - Branch')),
                    DataColumn(label: Text('Customer Name')),
                    DataColumn(label: Text('Cheque Status')),
                    DataColumn(label: Text('Cheque Amount')),
                    DataColumn(label: Text('Action')),
                  ],
                  rows: _cheques.map((cheque) {
                    return DataRow(
                      cells: [
                        DataCell(Text(cheque['chequeDate'] ?? '')),
                        DataCell(Text(cheque['chequeNo'] ?? '')),
                        DataCell(Text(cheque['bankNameBranch'] ?? '')),
                        DataCell(Text(cheque['customerName'] ?? '')),
                        DataCell(Text(cheque['chequeStatus'] ?? '')),
                        DataCell(Text(cheque['chequeAmount'] ?? '')),
                        DataCell(
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                _cheques.remove(cheque);
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
