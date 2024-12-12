import 'package:flutter/material.dart';
import 'package:medicare_ecommerce_app/app/admin/view/admin_home/manage_account/view/all_cheque_list_screen.dart';
import 'package:medicare_ecommerce_app/app/admin/view/admin_home/manage_account/view/balance_in_out_screen.dart';
import 'package:medicare_ecommerce_app/app/admin/view/admin_home/manage_account/view/bank_account_screen.dart';
import 'package:medicare_ecommerce_app/app/admin/view/admin_home/manage_account/view/bank_ledger_screen.dart';
import 'package:medicare_ecommerce_app/app/admin/view/admin_home/manage_account/view/bank_transaction_report_screen.dart';
import 'package:medicare_ecommerce_app/app/admin/view/admin_home/manage_account/view/bank_transaction_screen.dart';
import 'package:medicare_ecommerce_app/app/admin/view/admin_home/manage_account/view/cash_payment_screen.dart';
import 'package:medicare_ecommerce_app/app/admin/view/admin_home/manage_account/view/cash_transaction_report_screen.dart';
import 'package:medicare_ecommerce_app/app/admin/view/admin_home/manage_account/view/cash_transaction_screen.dart';
import 'package:medicare_ecommerce_app/app/admin/view/admin_home/manage_account/view/cash_view_screen.dart';
import 'package:medicare_ecommerce_app/app/admin/view/admin_home/manage_account/view/cheque_entry_screen.dart';
import 'package:medicare_ecommerce_app/app/admin/view/admin_home/manage_account/view/dishonoured_cheque_list.dart';
import 'package:medicare_ecommerce_app/app/admin/view/admin_home/manage_account/view/paid_cheque_list.dart';
import 'package:medicare_ecommerce_app/app/admin/view/admin_home/manage_account/view/payment_received_screen.dart';
import 'package:medicare_ecommerce_app/app/admin/view/admin_home/manage_account/view/pending_cheque_list.dart';
import 'package:medicare_ecommerce_app/app/admin/view/admin_home/manage_account/view/reminder_cheque_list_screen.dart';
import 'package:medicare_ecommerce_app/app/admin/view/admin_home/manage_account/view/supplier_payment_screen.dart';
import 'package:medicare_ecommerce_app/app/admin/view/admin_home/manage_account/view/transaction_accout_screen.dart';

class ManageAccount extends StatelessWidget {
  final List<Map<String, dynamic>> gridItems = [
    {
      'name': 'Cash Transaction',
      'icon': Icons.attach_money,
      'screen': CashTransactionScreen()
    },
    {
      'name': 'Bank Transactions',
      'icon': Icons.account_balance,
      'screen': BankTransactionScreen()
    },
    {
      'name': 'Payment Received',
      'icon': Icons.payment,
      'screen': PaymentReceivedScreen()
    },
    {
      'name': 'Supplier Payment',
      'icon': Icons.shopping_cart,
      'screen': SupplierPaymentScreen()
    },
    {'name': 'Cash View', 'icon': Icons.visibility, 'screen': CashViewScreen()},
    {
      'name': 'Transaction Account',
      'icon': Icons.account_box,
      'screen': TransactionAccountScreen()
    },
    {
      'name': 'Bank Account',
      'icon': Icons.account_balance_wallet,
      'screen': BankAccountScreen()
    },
    {
      'name': 'Cheque Entry',
      'icon': Icons.edit_note,
      'screen': ChequeEntryScreen()
    },
    {
      'name': 'All Cheque List',
      'icon': Icons.list,
      'screen': AllChequeListScreen()
    },
    {
      'name': 'Reminder Cheque List',
      'icon': Icons.notifications_active,
      'screen': ReminderChequeListScreen()
    },
    {
      'name': 'Pending Cheque List',
      'icon': Icons.pending,
      'screen': PendingChequeList()
    },
    {
      'name': 'Dishonoured Cheque List',
      'icon': Icons.error,
      'screen': DishonouredChequeList()
    },
    {
      'name': 'Paid Cheque List',
      'icon': Icons.check_circle,
      'screen': PaidChequeListScreen()
    },
    {
      'name': 'Cash Transaction Report',
      'icon': Icons.report,
      'screen': CashTransactionReportScreen()
    },
    {
      'name': 'Bank Transaction Report',
      'icon': Icons.report_gmailerrorred,
      'screen': BankTransactionReportScreen()
    },
    {'name': 'Bank Ledger', 'icon': Icons.book, 'screen': BankLedgerScreen()},
    {
      'name': 'Cash Payment',
      'icon': Icons.money_off,
      'screen': CashPaymentScreen()
    },
    {
      'name': 'Balance In Out',
      'icon': Icons.swap_vert,
      'screen': BalanceInOutScreen()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manage Account',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 3 items in a row
            mainAxisSpacing: 10, // Space between rows
            crossAxisSpacing: 10, // Space between columns
          ),
          itemCount: gridItems.length,
          itemBuilder: (context, index) {
            final item = gridItems[index];
            Widget screen = item['screen'];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item['icon'], size: 40, color: Colors.blue[700]),
                  const SizedBox(height: 10),
                  Text(
                    item['name'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
