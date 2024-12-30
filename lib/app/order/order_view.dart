import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_ecommerce_app/demo.dart';

import 'order_history_controller.dart';

class OrderView extends StatelessWidget {
  final controller = Get.put(OrderHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: controller.orderHistyList.length,
                  itemBuilder: (context, index) {
                    final order = controller.orderHistyList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Displaying Invoice Number prominently
                            Text(
                              'Invoice: ${order.saleMasterInvoiceNo}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Displaying Name and Date side by side
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildTitleValue(
                                    'Name', order.customerName ?? 'Unknown'),
                                _buildTitleValue(
                                    'Date', order.saleMasterSaleDate ?? '-'),
                              ],
                            ),
                            const SizedBox(height: 8),
                            // Displaying Amount Details
                            _buildTitleValueRow('Total Amount:',
                                '৳${order.saleMasterTotalSaleAmount}'),
                            _buildTitleValueRow('Paid Amount:',
                                '৳${order.saleMasterPaidAmount}'),
                            _buildTitleValueRow(
                                'Due Amount:', '৳${order.saleMasterDueAmount}'),
                            const SizedBox(height: 12),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Navigate to order details screen
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              InvoicePage(saleMaster: order)));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                ),
                                child: const Text(
                                  'See Details',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }

  Widget _buildTitleValue(String title, String value) {
    return Row(
      children: [
        Text(
          '$title: ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildTitleValueRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value ?? '-',
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
