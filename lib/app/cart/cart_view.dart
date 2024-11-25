import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../res/color.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
        ),
      ),
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
                    height: 100,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey.withOpacity(0.5)),
                    child: Column(
                      children: [
                        Icon(Icons.add, color: Colors.black,size: 17),
                        Text('1',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                        Icon(Icons.remove, color: Colors.black,size: 17,)
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
