import 'package:flutter/material.dart';
import 'package:pharnacy_trust/inner_screens/orders_screen/order_screen_view.dart';
import 'package:pharnacy_trust/inner_screens/viewd_screen/viewd_screen_body.dart';
import 'package:pharnacy_trust/inner_screens/wishList_screen/wish_list.dart';
import 'package:pharnacy_trust/screens/cart/widget/card_screen.dart';
import 'package:pharnacy_trust/screens/category_screen.dart';
import 'package:pharnacy_trust/screens/shop_view.dart';
import 'package:pharnacy_trust/screens/user_info.dart';
import 'package:pharnacy_trust/service/global_methods.dart';
import 'package:pharnacy_trust/widget/user_info_widgets/address_dialog_method.dart';
import 'package:pharnacy_trust/widget/user_info_widgets/log_out_method.dart';

class Constss {
  static GlobalMethods globalMethods = GlobalMethods();
  static List<String> loginImages = [
    'assets/login_photos/pexels-anntarazevich-5910953.jpg',
    'assets/login_photos/pexels-polina-tankilevitch-3873135.jpg',
    'assets/login_photos/pexels-mart-production-7230183.jpg',
    'assets/login_photos/pexels-pixabay-139398.jpg'
  ];
  static List<Map<String, dynamic>> pages = [
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

  static List<Map<String, dynamic>> categoryList = [
    {
      "imageUrl": "assets/category_assets/cat-1.png",
      "title": "Category Title 1",
      "color": Colors.blue,
    },
    {
      "imageUrl": "assets/category_assets/cat-2.png",
      "title": "Category Title 2",
      "color": Colors.red,
    },
    {
      "imageUrl": "assets/category_assets/cat-3.png",
      "title": "Category Title 3",
      "color": Colors.green,
    },
    {
      "imageUrl": "assets/category_assets/cat-4.png",
      "title": "Category Title 4",
      "color": Colors.purple,
    },
    {
      "imageUrl": "assets/category_assets/cat-5.png",
      "title": "Category Title 5",
      "color": Colors.orange,
    },
    {
      "imageUrl": "assets/category_assets/cat-6.png",
      "title": "Category Title 6",
      "color": Colors.pink,
    },
  ];

  static List<Map<String, dynamic>> userDetails = [
    {
      'title': 'Address',
      'icona': const Icon(
        Icons.home_outlined,
        color: Colors.blue,
        size: 30,
      ),
      "onTap": (context) => showDialog(
            context: context,
            builder: (context) => AddressDialog(
              context: context,
            ),
          ),
    },
    {
      'title': 'Orders',
      'icona': const Icon(
        Icons.category_outlined,
        color: Colors.blue,
        size: 30,
      ),
      "onTap": (context) {
        globalMethods.navigateTo(
          ctx: context,
          routeName: OrderScreenView.routeName,
        );
      }
    },
    {
      'title': 'Wishlist',
      'icona': const Icon(
        Icons.favorite_border,
        color: Colors.blue,
        size: 30,
      ),
      "onTap": (context) {
        globalMethods.navigateTo(
          ctx: context,
          routeName: WishList.routeName,
        );
      }
    },
    {
      'title': 'viewed products',
      'icona': const Icon(
        Icons.visibility_outlined,
        color: Colors.blue,
        size: 30,
      ),
      "onTap": (context) {
        globalMethods.navigateTo(
          ctx: context,
          routeName: ViewdScreenBody.routeName,
        );
      },
    },
    {
      'title': 'Forget password',
      'icona': const Icon(
        Icons.password_outlined,
        color: Colors.blue,
        size: 30,
      ),
    },
    {
      'title': 'Logout',
      'icona': const Icon(
        Icons.logout_outlined,
        color: Colors.blue,
        size: 30,
      ),
      "onTap": (context) => showDialog(
            context: context,
            builder: (context) => LogOutMethod(
              context: context,
            ),
          ),
    },
  ];
}
