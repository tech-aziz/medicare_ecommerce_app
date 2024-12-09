import 'package:flutter/material.dart';

class PaidChequeListScreen extends StatefulWidget {
  @override
  _PaidChequeListScreenState createState() => _PaidChequeListScreenState();
}

class _PaidChequeListScreenState extends State<PaidChequeListScreen> {
  int _itemsPerPage = 10;
  int _currentPage = 1;

  // Updated demo data to match the new headers
  List<Map<String, dynamic>> _cheques = List.generate(
    50,
    (index) => {
      'chequeDate': '12/09/2024',
      'chequeNo': 'Cheque ${index + 1}',
      'bankNameBranch': 'Bank ${index % 5 + 1} - Branch ${index % 3 + 1}',
      'customerName': 'Customer ${index + 1}',
      'submittedDate': '12/09/2024', // Added submitted date
      'chequeAmount':
          (index + 1) * 100.0, // Corrected to double to avoid type errors
    },
  );

  String? _searchQuery;

  // Method to filter the cheques based on the search query
  List<Map<String, dynamic>> getFilteredCheques() {
    if (_searchQuery == null || _searchQuery!.isEmpty) {
      return _cheques;
    } else {
      return _cheques
          .where((cheque) => cheque['customerName']
              .toString()
              .toLowerCase()
              .contains(_searchQuery!.toLowerCase()))
          .toList();
    }
  }

  // Method to handle the pagination
  List<Map<String, dynamic>> getPagedCheques() {
    List<Map<String, dynamic>> filteredCheques = getFilteredCheques();
    int startIndex = (_currentPage - 1) * _itemsPerPage;
    int endIndex = startIndex + _itemsPerPage;

    return filteredCheques.sublist(startIndex,
        endIndex < filteredCheques.length ? endIndex : filteredCheques.length);
  }

  // Method to handle the previous button click
  void _previousPage() {
    if (_currentPage > 1) {
      setState(() {
        _currentPage--;
      });
    }
  }

  // Method to handle the next button click
  void _nextPage() {
    if ((_currentPage * _itemsPerPage) < getFilteredCheques().length) {
      setState(() {
        _currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paid Cheque List'),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Row with Dropdown for Items per Page and Search Text Field
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Dropdown for items per page
                  Row(
                    children: [
                      Text('Display: '),
                      DropdownButton<int>(
                        value: _itemsPerPage,
                        onChanged: (int? newValue) {
                          setState(() {
                            _itemsPerPage = newValue!;
                            _currentPage =
                                1; // Reset to first page after changing items per page
                          });
                        },
                        items: [10, 20, 30]
                            .map((item) => DropdownMenuItem<int>(
                                  value: item,
                                  child: Text('$item'),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                  // Search Text Field
                  Container(
                    width: 200,
                    child: TextField(
                      onChanged: (query) {
                        setState(() {
                          _searchQuery = query;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Search',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Table displaying the cheque information
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('#')),
                    DataColumn(label: Text('Cheque Date')),
                    DataColumn(label: Text('Cheque No')),
                    DataColumn(label: Text('Bank Name - Branch Name')),
                    DataColumn(label: Text('Customer Name')),
                    DataColumn(label: Text('Submitted Date')),
                    DataColumn(label: Text('Cheque Amount')),
                  ],
                  rows: getPagedCheques().map((cheque) {
                    return DataRow(
                      cells: [
                        DataCell(Text(
                            '${_cheques.indexOf(cheque) + 1}')), // Added index for #
                        DataCell(Text(cheque['chequeDate'] ?? '')),
                        DataCell(Text(cheque['chequeNo'] ?? '')),
                        DataCell(Text(cheque['bankNameBranch'] ?? '')),
                        DataCell(Text(cheque['customerName'] ?? '')),
                        DataCell(Text(cheque['submittedDate'] ??
                            '')), // Added submitted date
                        DataCell(Text(cheque['chequeAmount'].toString() ?? '')),
                      ],
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),

              // Row with Previous and Next Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _previousPage,
                    child: Text('Previous'),
                  ),
                  ElevatedButton(
                    onPressed: _nextPage,
                    child: Text('Next'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
