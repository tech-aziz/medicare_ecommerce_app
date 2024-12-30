import 'package:flutter/material.dart';
import 'package:medicare_ecommerce_app/app/order/order_model.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class InvoicePage extends StatelessWidget {
  final OrderHistoryModel saleMaster;

  InvoicePage({required this.saleMaster});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Invoice'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'TOP HEALTH PHARMA',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text('Mirpur-11, Dhaka, Bangladesh'),
                const Text('Mobile:'),
                const SizedBox(height: 12),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Invoice No: ${saleMaster.saleMasterInvoiceNo}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Sales Date: ${saleMaster.saleMasterSaleDate}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Customer Info Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Customer Id: ${saleMaster.customerCode}'),
                Text('Customer Name: ${saleMaster.customerName}'),
                Text('Customer Address: ${saleMaster.customerAddress}'),
                Text('Customer Mobile: ${saleMaster.customerMobile}'),
                const Divider(),
              ],
            ),
            const SizedBox(height: 16),

            // Sale Details Section
            Expanded(
              child: ListView.builder(
                itemCount: saleMaster.saleDetails!.length,
                itemBuilder: (context, index) {
                  final detail = saleMaster.saleDetails![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${index + 1}. ${detail.productName}'),
                        Text('৳${detail.saleDetailsTotalAmount}'),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Payment Summary
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                _buildSummaryRow(
                    'Sub Total:', saleMaster.saleMasterSubTotalAmount),
                _buildSummaryRow('VAT:', saleMaster.saleMasterTaxAmount),
                _buildSummaryRow(
                    'Discount:', saleMaster.saleMasterTotalDiscountAmount),
                _buildSummaryRow(
                    'Total:', saleMaster.saleMasterTotalSaleAmount),
                _buildSummaryRow('Paid:', saleMaster.saleMasterPaidAmount),
                _buildSummaryRow('Due:', saleMaster.saleMasterDueAmount),
              ],
            ),

            // Buttons
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () => _generatePDF(saleMaster),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Text('Download PDF'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('৳${value ?? '0.00'}'),
        ],
      ),
    );
  }

  Future<void> _generatePDF(OrderHistoryModel saleMaster) async {
  // Check if saleDetails is null or empty
  if (saleMaster.saleDetails == null || saleMaster.saleDetails!.isEmpty) {
    print("No sale details available.");
    return;
  }

  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'TOP HEALTH PHARMA',
            style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
          ),
          pw.Text('Mirpur-11, Dhaka, Bangladesh'),
          pw.Divider(),
          pw.Text('Invoice No: ${saleMaster.saleMasterInvoiceNo}'),
          pw.Text('Sales Date: ${saleMaster.saleMasterSaleDate}'),
          pw.Divider(),
          pw.Text('Customer Id: ${saleMaster.customerCode}'),
          pw.Text('Customer Name: ${saleMaster.customerName}'),
          pw.Text('Customer Mobile: ${saleMaster.customerMobile}'),
          pw.Divider(),
          pw.Table.fromTextArray(
            context: context,
            data: [
              ['Sl', 'Product Name', 'Quantity', 'Rate', 'Total'],
              ...saleMaster.saleDetails!.map((detail) => [
                saleMaster.saleDetails!.indexOf(detail) + 1,
                detail.productName,
                detail.saleDetailsTotalQuantity,
                detail.saleDetailsRate,
                detail.saleDetailsTotalAmount,
              ]),
            ],
          ),
          pw.Divider(),
          pw.Text('Total: ৳${saleMaster.saleMasterTotalSaleAmount}'),
        ],
      ),
    ),
  );

  try {
    final directory = await getApplicationDocumentsDirectory();
    print("Saving PDF to: ${directory.path}");

    // File path construction
    final file = File('${directory.path}/invoice_${saleMaster.saleMasterInvoiceNo}.pdf');
    await file.writeAsBytes(await pdf.save());
    print("PDF saved to ${file.path}");
  } catch (e) {
    print("Error generating PDF: $e");
  }
}

}

class SaleMaster {
  String? saleMasterInvoiceNo;
  String? saleMasterSaleDate;
  String? saleMasterTotalSaleAmount;
  String? saleMasterSubTotalAmount;
  String? saleMasterTaxAmount;
  String? saleMasterTotalDiscountAmount;
  String? saleMasterPaidAmount;
  String? saleMasterDueAmount;
  String? customerCode;
  String? customerName;
  String? customerAddress;
  String? customerMobile;
  List<SaleDetail> saleDetails;

  SaleMaster({
    this.saleMasterInvoiceNo,
    this.saleMasterSaleDate,
    this.saleMasterTotalSaleAmount,
    this.saleMasterSubTotalAmount,
    this.saleMasterTaxAmount,
    this.saleMasterTotalDiscountAmount,
    this.saleMasterPaidAmount,
    this.saleMasterDueAmount,
    this.customerCode,
    this.customerName,
    this.customerAddress,
    this.customerMobile,
    required this.saleDetails,
  });
}

class SaleDetail {
  String? productName;
  String? saleDetailsTotalQuantity;
  String? saleDetailsRate;
  String? saleDetailsTotalAmount;

  SaleDetail({
    this.productName,
    this.saleDetailsTotalQuantity,
    this.saleDetailsRate,
    this.saleDetailsTotalAmount,
  });
}



// class SaleMaster {
//   String saleMasterSlNo;
//   String saleMasterInvoiceNo;
//   String salseCustomerIdNo;
//   String? employeeId;
//   String saleMasterSaleDate;
//   String saleMasterDescription;
//   String saleMasterSaleType;
//   String paymentType;
//   String? bankId;
//   double saleMasterTotalSaleAmount;
//   double saleMasterTotalDiscountAmount;
//   double saleMasterTaxAmount;
//   double saleMasterFreight;
//   double saleMasterSubTotalAmount;
//   double saleMasterCashPaid;
//   double saleMasterBankPaid;
//   double saleMasterPaidAmount;
//   double saleMasterDueAmount;
//   double? saleMasterPreviousDue;
//   String status;
//   String isService;
//   String addBy;
//   String addTime;
//   String? updateBy;
//   String? updateTime;
//   String saleMasterBranchId;
//   String customerCode;
//   String customerName;
//   String customerMobile;
//   String customerAddress;
//   String? employeeName;
//   String brunchName;
//   List<SaleDetails> saleDetails;

//   SaleMaster({
//     required this.saleMasterSlNo,
//     required this.saleMasterInvoiceNo,
//     required this.salseCustomerIdNo,
//     this.employeeId,
//     required this.saleMasterSaleDate,
//     required this.saleMasterDescription,
//     required this.saleMasterSaleType,
//     required this.paymentType,
//     this.bankId,
//     required this.saleMasterTotalSaleAmount,
//     required this.saleMasterTotalDiscountAmount,
//     required this.saleMasterTaxAmount,
//     required this.saleMasterFreight,
//     required this.saleMasterSubTotalAmount,
//     required this.saleMasterCashPaid,
//     required this.saleMasterBankPaid,
//     required this.saleMasterPaidAmount,
//     required this.saleMasterDueAmount,
//     this.saleMasterPreviousDue,
//     required this.status,
//     required this.isService,
//     required this.addBy,
//     required this.addTime,
//     this.updateBy,
//     this.updateTime,
//     required this.saleMasterBranchId,
//     required this.customerCode,
//     required this.customerName,
//     required this.customerMobile,
//     required this.customerAddress,
//     this.employeeName,
//     required this.brunchName,
//     required this.saleDetails,
//   });

//   factory SaleMaster.fromJson(Map<String, dynamic> json) {
//     return SaleMaster(
//       saleMasterSlNo: json['SaleMaster_SlNo'],
//       saleMasterInvoiceNo: json['SaleMaster_InvoiceNo'],
//       salseCustomerIdNo: json['SalseCustomer_IDNo'],
//       employeeId: json['employee_id'],
//       saleMasterSaleDate: json['SaleMaster_SaleDate'],
//       saleMasterDescription: json['SaleMaster_Description'],
//       saleMasterSaleType: json['SaleMaster_SaleType'],
//       paymentType: json['payment_type'],
//       bankId: json['bank_id'],
//       saleMasterTotalSaleAmount:
//           double.parse(json['SaleMaster_TotalSaleAmount']),
//       saleMasterTotalDiscountAmount:
//           double.parse(json['SaleMaster_TotalDiscountAmount']),
//       saleMasterTaxAmount: double.parse(json['SaleMaster_TaxAmount']),
//       saleMasterFreight: double.parse(json['SaleMaster_Freight']),
//       saleMasterSubTotalAmount: double.parse(json['SaleMaster_SubTotalAmount']),
//       saleMasterCashPaid: double.parse(json['SaleMaster_cashPaid']),
//       saleMasterBankPaid: double.parse(json['SaleMaster_bankPaid']),
//       saleMasterPaidAmount: double.parse(json['SaleMaster_PaidAmount']),
//       saleMasterDueAmount: double.parse(json['SaleMaster_DueAmount']),
//       saleMasterPreviousDue: json['SaleMaster_Previous_Due'] != null
//           ? double.parse(json['SaleMaster_Previous_Due'])
//           : null,
//       status: json['Status'],
//       isService: json['is_service'],
//       addBy: json['AddBy'],
//       addTime: json['AddTime'],
//       updateBy: json['UpdateBy'],
//       updateTime: json['UpdateTime'],
//       saleMasterBranchId: json['SaleMaster_branchid'],
//       customerCode: json['Customer_Code'],
//       customerName: json['Customer_Name'],
//       customerMobile: json['Customer_Mobile'],
//       customerAddress: json['Customer_Address'],
//       employeeName: json['Employee_Name'],
//       brunchName: json['Brunch_name'],
//       saleDetails: (json['saleDetails'] as List)
//           .map((item) => SaleDetails.fromJson(item))
//           .toList(),
//     );
//   }
// }

// class SaleDetails {
//   String saleDetailsSlNo;
//   String saleMasterIdNo;
//   String productIdNo;
//   int saleDetailsTotalQuantity;
//   double purchaseRate;
//   double saleDetailsRate;
//   double saleDetailsDiscount;
//   double discountAmount;
//   double saleDetailsTax;
//   double saleDetailsTotalAmount;
//   String status;
//   String addBy;
//   String addTime;
//   String? updateBy;
//   String? updateTime;
//   String saleDetailsBranchId;
//   String productName;
//   String productCategoryName;

//   SaleDetails({
//     required this.saleDetailsSlNo,
//     required this.saleMasterIdNo,
//     required this.productIdNo,
//     required this.saleDetailsTotalQuantity,
//     required this.purchaseRate,
//     required this.saleDetailsRate,
//     required this.saleDetailsDiscount,
//     required this.discountAmount,
//     required this.saleDetailsTax,
//     required this.saleDetailsTotalAmount,
//     required this.status,
//     required this.addBy,
//     required this.addTime,
//     this.updateBy,
//     this.updateTime,
//     required this.saleDetailsBranchId,
//     required this.productName,
//     required this.productCategoryName,
//   });

//   factory SaleDetails.fromJson(Map<String, dynamic> json) {
//     return SaleDetails(
//       saleDetailsSlNo: json['SaleDetails_SlNo'],
//       saleMasterIdNo: json['SaleMaster_IDNo'],
//       productIdNo: json['Product_IDNo'],
//       saleDetailsTotalQuantity:
//           int.parse(json['SaleDetails_TotalQuantity'] ?? '0'),
//       purchaseRate: double.parse(json['Purchase_Rate']),
//       saleDetailsRate: double.parse(json['SaleDetails_Rate']),
//       saleDetailsDiscount: double.parse(json['SaleDetails_Discount']),
//       discountAmount: double.parse(json['Discount_amount']),
//       saleDetailsTax: double.parse(json['SaleDetails_Tax']),
//       saleDetailsTotalAmount: double.parse(json['SaleDetails_TotalAmount']),
//       status: json['Status'],
//       addBy: json['AddBy'],
//       addTime: json['AddTime'],
//       updateBy: json['UpdateBy'],
//       updateTime: json['UpdateTime'],
//       saleDetailsBranchId: json['SaleDetails_BranchId'],
//       productName: json['Product_Name'],
//       productCategoryName: json['ProductCategory_Name'],
//     );
//   }
// }
