import 'package:flutter/material.dart';
import 'package:pharnacy_trust/consts/theme_Data.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final bool isDarkTheme;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.isDarkTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor:
          isDarkTheme ? Theme.of(context).canvasColor : Colors.white,
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: isDarkTheme
          ? Colors.lightBlue.shade200
          : Theme.of(context).primaryColor,
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
            Icons.home_outlined,
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
    );
  }
}
