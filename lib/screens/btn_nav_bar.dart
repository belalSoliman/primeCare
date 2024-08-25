import 'package:flutter/material.dart';
import 'package:pharnacy_trust/consts/theme_Data.dart';
import 'package:pharnacy_trust/screens/cart_view.dart';
import 'package:pharnacy_trust/screens/category_screen.dart';
import 'package:pharnacy_trust/screens/shop_view.dart';
import 'package:pharnacy_trust/screens/user_info.dart';

class BtnNavBar extends StatefulWidget {
  const BtnNavBar({super.key});

  @override
  State<BtnNavBar> createState() => _BtnNavBarState();
}

class _BtnNavBarState extends State<BtnNavBar> {
  int currentIndex = 0;

  final List<Widget> _pages = [
    const ShopView(),
    const CategoryScreen(),
    const CartView(),
    const UserInfo(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Styles.themeData(false, context).primaryColor,
        unselectedItemColor: Colors.grey[400],
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: false,
        showUnselectedLabels: true,
        iconSize: 40,
        unselectedFontSize: 14,
        elevation: 100,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: currentIndex == 0
                  ? Styles.themeData(false, context).primaryColor
                  : Colors.grey[500],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category_outlined,
              color: currentIndex == 1
                  ? Styles.themeData(false, context).primaryColor
                  : Colors.grey[500],
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: currentIndex == 2
                  ? Styles.themeData(false, context).primaryColor
                  : Colors.grey[500],
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: currentIndex == 3
                  ? Styles.themeData(false, context).primaryColor
                  : Colors.grey[500],
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
