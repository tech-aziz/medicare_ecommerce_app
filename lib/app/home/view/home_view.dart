import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medicare_ecommerce_app/app/auth/login/view/login_view.dart';
import 'package:medicare_ecommerce_app/app/get_started/get_started.dart';
import 'package:medicare_ecommerce_app/app/profile/view/profile_view.dart';
import '../../all_product/view/all_product_view.dart';
import '../../bottom_pages/category_body/category_body.dart';
import '../../bottom_pages/home_body/home_body_view.dart';
import '../../cart/cart_view.dart';
import '../../helpers/launch_dialer_helper.dart';
import '../../notification/notification_view.dart';
import '../../order/order_view.dart';
import '../../res/color.dart';
import '../../res/component/custom_text_widget.dart';
import '../../search_page/search_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  bool isSwitched = false;
  bool isCheckedACI = false;
  bool isCheckedBeacon = false;
  bool isCheckedSKF = false;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> pages = [
    const HomeBodyView(),
    const CategoryBody(),
    const AllProductView(),
    const OrderView(),
    const CartView(),
    const ProfileView(),
  ];

  final List<String> _titles = [
    'Store Name',
    'Company',
    'Products',
    'Orders',
    'Cart',
    'Account',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: _currentIndex == 0
          ? Drawer(
              child: IntrinsicHeight(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Column(
                    children: [
                      UserAccountsDrawerHeader(
                        accountName: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.blue),
                          child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 2),
                              child: Text(
                                'Top Heath Pharma',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              )),
                        ),
                        accountEmail: const Text(
                          'medicare@gmail.com',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        currentAccountPicture: const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/empty.jpg'),
                        ),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        otherAccountsPictures: const [],
                      ),
                      ListTile(
                        onTap: () {
                          Get.back();
                        },
                        title: displayMedium(
                            data: 'Home',
                            fontSize: 14,
                            color: Colors.black,
                            textAlign: TextAlign.start),
                        leading: SvgPicture.asset(
                          'assets/icons/home.svg',
                          height: 20,
                          width: 20,
                          color: Colors.blue,
                        ),
                        trailing:
                            const Icon(Icons.keyboard_arrow_right_rounded),
                      ),
                      ListTile(
                        onTap: () {},
                        title: displayMedium(
                            data: 'About App',
                            fontSize: 14,
                            color: Colors.black,
                            textAlign: TextAlign.start),
                        leading: Image.asset(
                          'assets/icons/about_app.png',
                          height: 20,
                          width: 20,
                          color: Colors.blue,
                        ),
                        trailing:
                            const Icon(Icons.keyboard_arrow_right_rounded),
                      ),
                      ListTile(
                        onTap: () {},
                        title: displayMedium(
                            data: 'Privacy Policy',
                            fontSize: 14,
                            color: Colors.black,
                            textAlign: TextAlign.start),
                        leading: const Icon(
                          Icons.privacy_tip_outlined,
                          color: Colors.blue,
                          size: 22,
                        ),
                        trailing:
                            const Icon(Icons.keyboard_arrow_right_rounded),
                      ),
                      ListTile(
                        onTap: () {},
                        title: displayMedium(
                            data: 'Feedback',
                            fontSize: 14,
                            color: Colors.black,
                            textAlign: TextAlign.start),
                        leading: Image.asset(
                          'assets/icons/term_condition.png',
                          height: 20,
                          width: 20,
                          color: Colors.blue,
                        ),
                        trailing:
                            const Icon(Icons.keyboard_arrow_right_rounded),
                      ),
                      ListTile(
                        onTap: () {},
                        title: displayMedium(
                            data: 'Rating',
                            fontSize: 14,
                            color: Colors.black,
                            textAlign: TextAlign.start),
                        leading: const Icon(
                          Icons.star_border_purple500_sharp,
                          color: Colors.blue,
                          size: 22,
                        ),
                        trailing:
                            const Icon(Icons.keyboard_arrow_right_rounded),
                      ),
                      ListTile(
                        onTap: () {
                          Get.offAll(GetStarted());
                          // showAlertDialog(context)
                        },
                        title: displayMedium(
                            data: 'Log out',
                            fontSize: 14,
                            color: Colors.black,
                            textAlign: TextAlign.start),
                        leading: SvgPicture.asset(
                          'assets/icons/logout.svg',
                          height: 20,
                          width: 20,
                          color: Colors.blue,
                        ),
                        trailing:
                            const Icon(Icons.keyboard_arrow_right_rounded),
                      ),
                      ListTile(
                        onTap: () {
                          print('Account deleted');
                          Get.back();
                        },
                        title: displayMedium(
                            data: 'Delete account',
                            fontSize: 14,
                            color: Colors.black,
                            textAlign: TextAlign.start),
                        leading: SvgPicture.asset(
                          'assets/icons/delete_profile.svg',
                          height: 22,
                          width: 22,
                          color: Colors.blue,
                        ),
                        trailing:
                            const Icon(Icons.keyboard_arrow_right_rounded),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            displayMedium(
                                data: 'Version 1.0',
                                fontSize: 14,
                                color: Colors.black,
                                textAlign: TextAlign.start)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          : null,
      endDrawer: _currentIndex == 0
          ? Drawer(
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          'Filter By',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recent Products',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          'Company',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Search Product ',
                                  border: InputBorder.none),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ACI LTD.',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                          value: isCheckedACI,
                          focusColor: AppColors.primaryColor,
                          activeColor: AppColors.primaryColor,
                          onChanged: (newValue) {
                            setState(() {
                              isCheckedACI = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 4,
                    color: Colors.black.withOpacity(0.1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Beacon PLC.',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                          value: isCheckedBeacon,
                          focusColor: AppColors.primaryColor,
                          activeColor: AppColors.primaryColor,
                          onChanged: (newValue) {
                            setState(() {
                              isCheckedBeacon = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 4,
                    color: Colors.black.withOpacity(0.1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SK-F LTD.',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                          value: isCheckedSKF,
                          focusColor: AppColors.primaryColor,
                          activeColor: AppColors.primaryColor,
                          onChanged: (newValue) {
                            setState(() {
                              isCheckedSKF = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 4,
                    color: Colors.black.withOpacity(0.1),
                  ),
                ],
              ),
            )
          : null,
      appBar: AppBar(
        title: _currentIndex == 0
            ? InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchView()),
                  );
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Text(
                        'Search',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              )
            : Text(
                _titles[_currentIndex],
                style: const TextStyle(color: Colors.white),
              ),
        backgroundColor: Colors.blueAccent,
        leading: _currentIndex == 0
            ? IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/icons/menu.svg',
                    // width: 30,
                    height: 27,
                    color: Colors.white,
                  ),
                ),
                onPressed: () => scaffoldKey.currentState?.openDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              )
            : null,
        actions: _currentIndex == 0
            ? [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          openDialer("+8801814556688");
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/phone.svg',
                          height: 25,
                          width: 25,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {
                          Get.to(() => const NotificationView());
                        },
                        icon: Image.asset(
                          'assets/icons/notification.png',
                          height: 26,
                          width: 26,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () =>
                            scaffoldKey.currentState?.openEndDrawer(),
                        icon: SvgPicture.asset('assets/icons/filter.svg',
                            height: 25, width: 25, color: Colors.white)),
                    const SizedBox(
                      width: 6,
                    ),
                  ],
                )
              ]
            : null,
      ),
      body: (_currentIndex >= 0 && _currentIndex < pages.length)
          ? pages[_currentIndex]
          : Center(child: Text("Invalid page index: $_currentIndex")),
      bottomNavigationBar: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey.shade200,
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index >= 0 && index < pages.length) {
              setState(() {
                _currentIndex = index;
              });
            }
          },
          // To show all items with text
          selectedItemColor: Colors.blueAccent,
          elevation: 0,
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          selectedLabelStyle: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.normal,
              fontFamily: 'TiroBangla-Italic'),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                height: 22,
                width: 22,
                color: _currentIndex == 0
                    ? Colors.blue
                    : Colors.grey.withOpacity(0.8),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/category.svg',
                height: 22,
                width: 22,
                color: _currentIndex == 1
                    ? Colors.blue
                    : Colors.grey.withOpacity(0.8),
              ),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.all_inbox),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/order.svg',
                height: 22,
                width: 22,
                color: _currentIndex == 3
                    ? Colors.blue
                    : Colors.grey.withOpacity(0.8),
              ),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/shopping-cart.svg',
                height: 22,
                width: 22,
                color: _currentIndex == 4
                    ? Colors.blue
                    : Colors.grey.withOpacity(0.8),
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/account.svg',
                height: 22,
                width: 22,
                color: _currentIndex == 5
                    ? Colors.blue
                    : Colors.grey.withOpacity(0.8),
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
