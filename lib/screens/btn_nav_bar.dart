import 'package:flutter/material.dart';

import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:pharnacy_trust/screens/cart_view.dart';
import 'package:pharnacy_trust/screens/category_screen.dart';
import 'package:pharnacy_trust/screens/shop_view.dart';
import 'package:pharnacy_trust/screens/user_info.dart';
import 'package:pharnacy_trust/widget/btn_nav_bar_widgets/btn_nav_bar.dart';

import 'package:provider/provider.dart';

class BtnNavBar extends StatefulWidget {
  const BtnNavBar({super.key});

  @override
  State<BtnNavBar> createState() => _BtnNavBarState();
}

class _BtnNavBarState extends State<BtnNavBar> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      "page": const ShopView(),
      "title": "Shop",
    },
    {
      "page": const CategoryScreen(),
      "title": "Categories",
    },
    {
      "page": const CartView(),
      "title": "Cart",
    },
    {
      "page": const UserInfo(),
      "title": "User Info",
    }
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final darkThemeProvider = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[currentIndex]["title"],
          style: TextStyle(
              color: darkThemeProvider.darkTheme ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 60,
        backgroundColor: darkThemeProvider.darkTheme
            ? Theme.of(context).canvasColor
            : Colors.white,
      ),
      body: _pages[currentIndex]["page"],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        isDarkTheme: darkThemeProvider.darkTheme,
      ),
    );
  }
}
