import 'package:flutter/material.dart';

class PurchaseView extends StatefulWidget {
  const PurchaseView({Key? key}) : super(key: key);

  @override
  State<PurchaseView> createState() => _PurchaseViewState();
}

class _PurchaseViewState extends State<PurchaseView> {
  String? selectedInvoice;
  String? selectedSupplier;
  String? selectedProduct;

  Widget buildReusableText(String label, {double fontSize = 12}) {
    return Text(
      label,
      style: TextStyle(fontSize: fontSize),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase View'),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Column for Invoice, Added By, and Date Picker
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Invoice No',
                      labelStyle: const TextStyle(fontSize: 12),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    items: ["INV-001", "INV-002", "INV-003"]
                        .map((invoice) => DropdownMenuItem(
                              value: invoice,
                              child: Text(invoice,
                                  style: const TextStyle(fontSize: 12)),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedInvoice = value;
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: buildReusableText('Added By: Admin')),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                          },
                          icon: Icon(Icons.calendar_month)),
                      labelText: 'Select Date',
                      labelStyle: const TextStyle(fontSize: 12),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              buildReusableText(
                'Supplier & Product Information',
                fontSize: 14,
              ),
              // Supplier and Product Information Section
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black.withOpacity(0.5))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),

                      // Supplier Row
                      Row(
                        children: [
                          buildReusableText('Supplier:'),
                          const SizedBox(width: 12),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              items: ['Supplier 1', 'Supplier 2', 'Supplier 3']
                                  .map((supplier) => DropdownMenuItem(
                                        value: supplier,
                                        child: Text(supplier,
                                            style:
                                                const TextStyle(fontSize: 12)),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedSupplier = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          ElevatedButton(
                            onPressed: () {},
                            child: buildReusableText('Add'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Mobile Number Row
                      Row(
                        children: [
                          buildReusableText('Mobile No:'),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter mobile number',
                                hintStyle: const TextStyle(fontSize: 12),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Address Row
                      Row(
                        children: [
                          buildReusableText('Address:'),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter address',
                                hintStyle: const TextStyle(fontSize: 12),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Product Row
                      Row(
                        children: [
                          buildReusableText('Product:'),
                          const SizedBox(width: 12),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              items: ['Product 1', 'Product 2', 'Product 3']
                                  .map((product) => DropdownMenuItem(
                                        value: product,
                                        child: Text(product,
                                            style:
                                                const TextStyle(fontSize: 12)),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedProduct = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          ElevatedButton(
                            onPressed: () {},
                            child: buildReusableText('Add'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Purchase Rate and Quantity Row
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Pur. Rate',
                                labelStyle: const TextStyle(fontSize: 12),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Quantity',
                                labelStyle: const TextStyle(fontSize: 12),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'PCS',
                                labelStyle: const TextStyle(fontSize: 12),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Total Amount and Selling Price Row
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Total Amount',
                                labelStyle: const TextStyle(fontSize: 12),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Selling Price',
                                labelStyle: const TextStyle(fontSize: 12),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          ElevatedButton(
                            onPressed: () {},
                            child: buildReusableText('Add to Cart'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('SL')),
                      DataColumn(label: Text('Product Name')),
                      DataColumn(label: Text('Category')),
                      DataColumn(label: Text('Rate')),
                      DataColumn(label: Text('Quality')),
                      DataColumn(label: Text('Total')),
                      DataColumn(label: Text('Action')),
                    ],
                    rows: List<DataRow>.generate(
                      10, // Number of demo rows
                      (index) => DataRow(
                        cells: [
                          DataCell(Text((index + 1).toString())),
                          DataCell(Text('Product ${index + 1}')),
                          DataCell(Text('Category ${index % 3 + 1}')),
                          DataCell(Text('${(index + 1) * 10.0}')),
                          DataCell(Text('${(index + 1) * 2}')),
                          DataCell(Text('${(index + 1) * 20.0}')),
                          DataCell(
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                // Add delete functionality here
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Amount Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sub Total Field
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Sub Total',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // VAT Row
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'VAT',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text('%', style: TextStyle(fontSize: 16)),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'VAT Amount',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Discount Field
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Discount',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Transport and Labour Cost Fields
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Transport & Labour Cost',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Total Field
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Total',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Paid Field
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Paid',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Due and Previous Due Row
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Due',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Previous Due',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Buttons Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 24),
                            ),
                            child: const Text('Purchase'),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 24),
                            ),
                            child: const Text('Reset'),
                          ),
                        ],
                      ),
                    ],
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
