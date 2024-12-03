import 'package:flutter/material.dart';

import '../../res/color.dart';

class AllProductView extends StatelessWidget {
  const AllProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return   ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                primary: false,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                style: TextStyle(color: Colors.black.withOpacity(0.6),
                                  decoration:
                                  TextDecoration.lineThrough,),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.primaryColor,
                                ),
                                child: const Text(
                                  'Add to cart',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },);
  }
}