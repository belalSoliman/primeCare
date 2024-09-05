import 'package:flutter/material.dart';
import 'package:pharnacy_trust/consts/consts.dart';

import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:pharnacy_trust/provider/view_product.dart';

import 'package:pharnacy_trust/widget/btn_nav_bar_widgets/btn_nav_bar.dart';

import 'package:provider/provider.dart';

class BtnNavBar extends StatefulWidget {
  const BtnNavBar({super.key});
  static const routeName = "/BtnNavBar";
  @override
  State<BtnNavBar> createState() => _BtnNavBarState();
}

class _BtnNavBarState extends State<BtnNavBar> {
  int currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final darkThemeProvider = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      backgroundColor: darkThemeProvider.darkTheme
          ? const Color(0xff00001a)
          : Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          Constss.pages[currentIndex]["title"],
          style: TextStyle(
              color:
                  darkThemeProvider.darkTheme ? Colors.white : Colors.grey[600],
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 60,
        backgroundColor: darkThemeProvider.darkTheme
            ? Theme.of(context).canvasColor
            : Colors.white,
      ),
      body: Constss.pages[currentIndex]["page"],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        isDarkTheme: darkThemeProvider.darkTheme,
      ),
    );
  }
}
