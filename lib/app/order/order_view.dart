import 'package:flutter/material.dart';
import 'package:medicare_ecommerce_app/app/res/component/custom_button.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          primary: false,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.withOpacity(0.1)),
                child: ListTile(
                  leading: Image.asset('assets/images/tafnil.png',
                      fit: BoxFit.contain),
                  title: const Text('Eskayef Pharmaceuticals Ltd.'),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tufnil Tablet- (200mg)',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            '1 pcs',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.red.withOpacity(0.2),
                            ),
                            child: const Text(
                              '+10% Discount',
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            '৳90.00',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '100.00',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  trailing: Container(
                    width: 30,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.add, color: Colors.black, size: 17),
                        Text(
                          '1',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.remove,
                          color: Colors.black,
                          size: 17,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, -2), // Shadow position
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const  EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 1, color: Colors.grey, )
              ),
              
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Order Summary',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20), ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Order No',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                      Text('525356',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Order To',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),),
                      Text('Store Name',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),),

                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Order Summary',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20), ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cash on Delivery',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),),
                      Text('৳30.00',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),),


                    ],
                  ),
                  Divider(),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Items',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),),
                      Text('2 pcs',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),)

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),),
                      Text('৳270.00',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),)

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),),
                      Text('৳300.00',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),)

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Placed on',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),),
                      Text('12 nov 2024',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),)

                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12,),
            customButton(
                btnName: 'Confirm Order',
                color: Colors.blueAccent,
                textColor: Colors.white,
                borderColor: Colors.transparent,
                context: context)
          ],
        ),
      ),
    );
  }
}
