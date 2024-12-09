import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SupplierPaymentScreen extends StatefulWidget {
  @override
  _SupplierPaymentScreenState createState() => _SupplierPaymentScreenState();
}

class _SupplierPaymentScreenState extends State<SupplierPaymentScreen> {
  final TextEditingController _dueController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  String _selectedTransactionType = 'Select Transaction Type';
  String _selectedPaymentType = 'Select Payment Type';
  String _selectedSupplier = 'Select Supplier';

  final List<String> _transactionTypes = [
    'Select Transaction Type',
    'Purchase',
    'Service'
  ];
  final List<String> _paymentTypes = [
    'Select Payment Type',
    'Cash',
    'Bank Transfer',
    'Cheque'
  ];
  final List<String> _suppliers = [
    'Select Supplier',
    'Supplier A',
    'Supplier B',
    'Supplier C'
  ];

  List<Map<String, dynamic>> _payments = [
    {
      'transactionId': '1',
      'date': '12/09/2024',
      'supplier': 'Supplier A',
      'transactionType': 'Purchase',
      'paymentBy': 'Cash',
      'amount': '700.00',
      'description': 'Payment for goods',
      'savedBy': 'Admin'
    },
    {
      'transactionId': '2',
      'date': '10/09/2024',
      'supplier': 'Supplier B',
      'transactionType': 'Service',
      'paymentBy': 'Cheque',
      'amount': '2000.00',
      'description': 'Service fee payment',
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

  void _savePayment() {
    if (_selectedTransactionType != 'Select Transaction Type' &&
        _selectedPaymentType != 'Select Payment Type' &&
        _selectedSupplier != 'Select Supplier' &&
        _amountController.text.isNotEmpty) {
      setState(() {
        _payments.add({
          'transactionId': (_payments.length + 1).toString(),
          'date': DateFormat('dd/MM/yyyy').format(_selectedDate),
          'supplier': _selectedSupplier,
          'transactionType': _selectedTransactionType,
          'paymentBy': _selectedPaymentType,
          'amount': _amountController.text,
          'description': _descriptionController.text,
          'savedBy': 'CurrentUser', // Placeholder for user name
        });

        // Clear fields after saving
        _selectedTransactionType = 'Select Transaction Type';
        _selectedPaymentType = 'Select Payment Type';
        _selectedSupplier = 'Select Supplier';
        _amountController.clear();
        _descriptionController.clear();
        _dueController.clear();
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
          'Supplier Payment',
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

              // Payment Type Dropdown
              DropdownButtonFormField<String>(
                value: _selectedPaymentType,
                decoration: InputDecoration(
                  labelText: 'Payment Type',
                  border: OutlineInputBorder(),
                ),
                items: _paymentTypes
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentType = value!;
                  });
                },
              ),
              SizedBox(height: 10),

              // Row with Supplier Dropdown and Add Button
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedSupplier,
                      decoration: InputDecoration(
                        labelText: 'Supplier',
                        border: OutlineInputBorder(),
                      ),
                      items: _suppliers
                          .map((supplier) => DropdownMenuItem(
                                value: supplier,
                                child: Text(supplier),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedSupplier = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      // Add supplier logic can go here
                    },
                    icon: Icon(Icons.add, color: Colors.blue),
                  )
                ],
              ),
              SizedBox(height: 10),

              // Due Text Field
              TextField(
                controller: _dueController,
                decoration: InputDecoration(
                  labelText: 'Due',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),

              // Payment Date
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Payment Date',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                controller: TextEditingController(
                  text: DateFormat('dd/MM/yyyy').format(_selectedDate),
                ),
                onTap: () => _pickDate(context),
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

              // Row with Save and Cancel Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _savePayment,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child:
                          Text('Save', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Clear fields logic
                        _selectedTransactionType = 'Select Transaction Type';
                        _selectedPaymentType = 'Select Payment Type';
                        _selectedSupplier = 'Select Supplier';
                        _amountController.clear();
                        _descriptionController.clear();
                        _dueController.clear();
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child:
                          Text('Cancel', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Transactions Table
              Text(
                'Transaction List',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Transaction ID')),
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Supplier')),
                    DataColumn(label: Text('Transaction Type')),
                    DataColumn(label: Text('Payment By')),
                    DataColumn(label: Text('Amount')),
                    DataColumn(label: Text('Description')),
                    DataColumn(label: Text('Saved By')),
                    DataColumn(label: Text('Action')),
                  ],
                  rows: _payments.map((payment) {
                    return DataRow(
                      cells: [
                        DataCell(Text(payment['transactionId'] ?? '')),
                        DataCell(Text(payment['date'] ?? '')),
                        DataCell(Text(payment['supplier'] ?? '')),
                        DataCell(Text(payment['transactionType'] ?? '')),
                        DataCell(Text(payment['paymentBy'] ?? '')),
                        DataCell(Text(payment['amount'] ?? '')),
                        DataCell(Text(payment['description'] ?? '')),
                        DataCell(Text(payment['savedBy'] ?? '')),
                        DataCell(
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                _payments.remove(payment);
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
