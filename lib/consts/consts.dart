import 'package:flutter/material.dart';
import 'package:pharnacy_trust/inner_screens/orders_screen/order_screen_view.dart';
import 'package:pharnacy_trust/inner_screens/viewd_screen/viewd_screen_body.dart';
import 'package:pharnacy_trust/inner_screens/wishList_screen/wish_list.dart';
import 'package:pharnacy_trust/models/product_model.dart';
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
  static const googleIcon =
      '''<svg width="16" height="17" viewBox="0 0 16 17" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M15.9988 8.3441C15.9988 7.67295 15.9443 7.18319 15.8265 6.67529H8.1626V9.70453H12.6611C12.5705 10.4573 12.0807 11.5911 10.9923 12.3529L10.9771 12.4543L13.4002 14.3315L13.5681 14.3482C15.1099 12.9243 15.9988 10.8292 15.9988 8.3441Z" fill="#4285F4"/>
<path d="M8.16265 16.3254C10.3666 16.3254 12.2168 15.5998 13.5682 14.3482L10.9924 12.3528C10.3031 12.8335 9.37796 13.1691 8.16265 13.1691C6.00408 13.1691 4.17202 11.7452 3.51894 9.7771L3.42321 9.78523L0.903556 11.7352L0.870605 11.8268C2.2129 14.4933 4.9701 16.3254 8.16265 16.3254Z" fill="#34A853"/>
<path d="M3.519 9.77716C3.34668 9.26927 3.24695 8.72505 3.24695 8.16275C3.24695 7.6004 3.34668 7.05624 3.50994 6.54834L3.50537 6.44017L0.954141 4.45886L0.870669 4.49857C0.317442 5.60508 0 6.84765 0 8.16275C0 9.47785 0.317442 10.7204 0.870669 11.8269L3.519 9.77716Z" fill="#FBBC05"/>
<path d="M8.16265 3.15623C9.69541 3.15623 10.7293 3.81831 11.3189 4.3716L13.6226 2.12231C12.2077 0.807206 10.3666 0 8.16265 0C4.9701 0 2.2129 1.83206 0.870605 4.49853L3.50987 6.54831C4.17202 4.58019 6.00408 3.15623 8.16265 3.15623Z" fill="#EB4335"/>
</svg>''';

  static const facebookIcon =
      '''<svg width="8" height="15" viewBox="0 0 8 15" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M5.02224 14.8963V8.10133H7.30305L7.64452 5.45323H5.02224V3.7625C5.02224 2.99583 5.23517 2.4733 6.33467 2.4733L7.73695 2.47265V0.104232C7.49432 0.0720777 6.66197 0 5.6936 0C3.67183 0 2.28768 1.23402 2.28768 3.50037V5.4533H0.000976562V8.1014H2.28761V14.8963L5.02224 14.8963Z" fill="#3C5A9A"/>
</svg>''';
}
