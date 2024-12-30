import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medicare_ecommerce_app/app/auth/login/view/login_view.dart';
import 'package:medicare_ecommerce_app/app/get_started/get_started.dart';
import 'package:medicare_ecommerce_app/app/profile/view/profile_view.dart';
import 'package:medicare_ecommerce_app/utils/login_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../all_product/view/all_product_view.dart';
import '../../auth/login/view/sign_in_as_user/sign_in_as_user.dart';
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
  Future<void> handleLogout(BuildContext context) async {
    try {
      // Clear SharedPreferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      print(prefs.getString("id"));
      setState(() {});

      // Navigate to the Sign-In screen
      Get.offAll(() => const SignInAsUser());
    } catch (e) {
      // Display an error message if something goes wrong
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "An error occurred during logout: $e",
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  final List<Widget> pages = [
    const HomeBodyView(),
    const CategoryBody(),
    const AllProductView(),
    OrderView(),
    const CartView(),
    const ProfileView(),
  ];

  final List<String> _titles = [
    'Store Name',
    'Category',
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
                          '',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        currentAccountPicture: const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/icons/splash_icon.jpeg'),
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
                        onTap: () async {
                          handleLogout(context);
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
                      ),
                      ListTile(
                        onTap: () {
                          Get.snackbar(
                              'Account Deleted Request', 'Sucessfully');
                          print('Account deleted');
                          // Get.back();
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
      // endDrawer: _currentIndex == 0
      //     ? Drawer(
      //         child: ListView(
      //           children: [
      //             const Padding(
      //               padding: EdgeInsets.symmetric(horizontal: 15),
      //               child: Row(
      //                 children: [
      //                   Text(
      //                     'Filter By',
      //                     style: TextStyle(
      //                         color: Colors.black,
      //                         fontWeight: FontWeight.bold,
      //                         fontSize: 16),
      //                   )
      //                 ],
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: 15),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   const Text(
      //                     'Recent Products',
      //                     style: TextStyle(
      //                         color: Colors.black,
      //                         fontWeight: FontWeight.bold,
      //                         fontSize: 16),
      //                   ),
      //                   Switch(
      //                     value: isSwitched,
      //                     onChanged: (value) {
      //                       setState(() {
      //                         isSwitched = value;
      //                       });
      //                     },
      //                   )
      //                 ],
      //               ),
      //             ),
      //             const Divider(),
      //             const Padding(
      //               padding: EdgeInsets.symmetric(horizontal: 15),
      //               child: Row(
      //                 children: [
      //                   Text(
      //                     'Company',
      //                     style: TextStyle(
      //                         color: Colors.black,
      //                         fontWeight: FontWeight.bold,
      //                         fontSize: 16),
      //                   )
      //                 ],
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 12,
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: 15),
      //               child: Container(
      //                 height: 40,
      //                 width: double.infinity,
      //                 decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     border: Border.all(color: Colors.grey, width: 1),
      //                     borderRadius: BorderRadius.circular(8)),
      //                 child: const Row(
      //                   children: [
      //                     Padding(
      //                       padding: EdgeInsets.symmetric(
      //                         horizontal: 8.0,
      //                       ),
      //                       child: Icon(
      //                         Icons.search,
      //                         color: Colors.grey,
      //                       ),
      //                     ),
      //                     Expanded(
      //                       child: TextField(
      //                         decoration: InputDecoration(
      //                             hintText: 'Search Product ',
      //                             border: InputBorder.none),
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 12,
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: 15),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Text(
      //                     'ACI LTD.',
      //                     style: TextStyle(
      //                       color: Colors.black.withOpacity(0.6),
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 16,
      //                     ),
      //                   ),
      //                   Checkbox(
      //                     value: isCheckedACI,
      //                     focusColor: AppColors.primaryColor,
      //                     activeColor: AppColors.primaryColor,
      //                     onChanged: (newValue) {
      //                       setState(() {
      //                         isCheckedACI = newValue!;
      //                       });
      //                     },
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Divider(
      //               thickness: 4,
      //               color: Colors.black.withOpacity(0.1),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: 15),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Text(
      //                     'Beacon PLC.',
      //                     style: TextStyle(
      //                       color: Colors.black.withOpacity(0.6),
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 16,
      //                     ),
      //                   ),
      //                   Checkbox(
      //                     value: isCheckedBeacon,
      //                     focusColor: AppColors.primaryColor,
      //                     activeColor: AppColors.primaryColor,
      //                     onChanged: (newValue) {
      //                       setState(() {
      //                         isCheckedBeacon = newValue!;
      //                       });
      //                     },
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Divider(
      //               thickness: 4,
      //               color: Colors.black.withOpacity(0.1),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: 15),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Text(
      //                     'SK-F LTD.',
      //                     style: TextStyle(
      //                       color: Colors.black.withOpacity(0.6),
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 16,
      //                     ),
      //                   ),
      //                   Checkbox(
      //                     value: isCheckedSKF,
      //                     focusColor: AppColors.primaryColor,
      //                     activeColor: AppColors.primaryColor,
      //                     onChanged: (newValue) {
      //                       setState(() {
      //                         isCheckedSKF = newValue!;
      //                       });
      //                     },
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Divider(
      //               thickness: 4,
      //               color: Colors.black.withOpacity(0.1),
      //             ),
      //           ],
      //         ),
      //       )
      //     : null,
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
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          elevation: 0,
          unselectedLabelStyle: const TextStyle(color: Colors.white70),
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          items: [
            _buildNavBarItem(
              icon: 'assets/icons/home.svg',
              label: 'Home',
              index: 0,
            ),
            _buildNavBarItem(
              icon: 'assets/icons/category.svg',
              label: 'Category',
              index: 1,
            ),
            _buildNavBarItem(
              icon: 'assets/icons/box.svg',
              label: 'Products',
              index: 2,
            ),
            _buildNavBarItem(
              icon: 'assets/icons/order.svg',
              label: 'Orders',
              index: 3,
            ),
            _buildNavBarItem(
              icon: 'assets/icons/shopping-cart.svg',
              label: 'Cart',
              index: 4,
            ),
            _buildNavBarItem(
              icon: 'assets/icons/account.svg',
              label: 'Profile',
              index: 5,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavBarItem({
    required String icon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: _currentIndex == index ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(8),
        child: SvgPicture.asset(
          icon,
          height: _currentIndex == index ? 28 : 22,
          width: _currentIndex == index ? 28 : 22,
          color: _currentIndex == index ? Colors.blueAccent : Colors.white,
        ),
      ),
      label: label,
    );
  }
}
