import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medicare_ecommerce_app/app/res/color.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  final List<Map<String, dynamic>> companyList = [
    {
      'name': 'Acme Ltd.',
      'img': 'assets/images/acme.png',
    },
    {
      'name': 'Square LTd.',
      'img': 'assets/images/square.png',
    },
    {
      'name': 'Ad-din',
      'img': 'assets/images/ad-din.png',
    },
    {
      'name': 'Albion',
      'img': 'assets/images/albion.png',
    },
    {
      'name': 'Alco Pharma',
      'img': 'assets/images/alco_pharma.png',
    },
    {
      'name': 'Ambee',
      'img': 'assets/images/ambee.png',
    },
    {
      'name': 'AMICO',
      'img': 'assets/images/amico.png',
    },
    {
      'name': 'Amulet',
      'img': 'assets/images/amulet.png',
    },
    {
      'name': 'APC',
      'img': 'assets/images/apc.png',
    },
  ];
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
          'Search',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.normal),
        ),
      ),
      body: Padding(
        padding:const  EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [

                Expanded(
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 8,bottom: 1),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                      children: [
                  
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Search Product ',
                                border: InputBorder.none),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/icons/filter.svg',
                        height: 25, width: 25, color: AppColors.primaryColor)),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.withOpacity(0.12),
              ),
              child: Text(
                'Place your order before dawn 5:00 to receive your item the same day .',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 16,
            ),

            Expanded(
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
                },),
            ),
            const SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }
}
