import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pharnacy_trust/consts/firebase_auth.dart';
import 'package:pharnacy_trust/consts/theme_data.dart';
import 'package:badges/badges.dart' as badges;

import 'package:pharnacy_trust/provider/cart_provider.dart';
import 'package:pharnacy_trust/screens/Auth/log_in.dart';
import 'package:provider/provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final bool isDarkTheme;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.isDarkTheme,
  });

  @override
  Widget build(BuildContext context) {
    final User? user = authinstance.currentUser;
    final cartItem = Provider.of<CartProvider>(context);
    return BottomNavigationBar(
      backgroundColor:
          isDarkTheme ? Theme.of(context).canvasColor : Colors.white,
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 3 && user == null) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const LogIn(),
          ));
        } else {
          // Handle other cases and profile if the user is logged in
          onTap(index);
        }
      },
      selectedItemColor: isDarkTheme
          ? Colors.lightBlue.shade200
          : Theme.of(context).primaryColor,
      unselectedItemColor: isDarkTheme ? Colors.white : Colors.grey[400],
      type: BottomNavigationBarType.shifting,
      showSelectedLabels: false,
      showUnselectedLabels: true,
      iconSize: 40,
      unselectedFontSize: 14,
      elevation: 100,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            IconlyLight.home,
            color: currentIndex == 0
                ? Styles.themeData(false, context).primaryColor
                : Colors.grey[500],
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            IconlyLight.category,
            color: currentIndex == 1
                ? Styles.themeData(false, context).primaryColor
                : Colors.grey[500],
          ),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: badges.Badge(
            badgeAnimation: const badges.BadgeAnimation.fade(
              curve: Curves.easeInCirc,
              toAnimate: true,
              animationDuration: Duration(milliseconds: 5000),
            ),
            position: badges.BadgePosition.topEnd(
              top: -14,
              end: -10,
            ),
            badgeContent: Text(
              cartItem.cartItems.length.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            badgeStyle: const badges.BadgeStyle(
                shape: badges.BadgeShape.circle,
                badgeColor: Colors.lightBlue,
                elevation: 10),
            child: Icon(
              Icons.shopping_cart_outlined,
              color: currentIndex == 2
                  ? Theme.of(context).primaryColor
                  : Colors.grey[500],
            ),
          ),
          label: 'Cart',
        ),
        user != null
            ? BottomNavigationBarItem(
                icon: Icon(
                  IconlyLight.user,
                  color: currentIndex == 3
                      ? Styles.themeData(false, context).primaryColor
                      : Colors.grey[500],
                ),
                label: 'Profile',
              )
            : BottomNavigationBarItem(
                icon: Icon(
                  IconlyLight.login,
                  color: currentIndex == 3
                      ? Styles.themeData(false, context).primaryColor
                      : Colors.grey[500],
                ),
                label: 'Login',
              )
      ],
    );
  }
}
