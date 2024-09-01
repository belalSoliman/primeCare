import 'package:flutter/material.dart';
import 'package:pharnacy_trust/consts/theme_data.dart';
import 'package:pharnacy_trust/inner_screens/feeds_screen_all_product.dart';
import 'package:pharnacy_trust/inner_screens/on_sale_screens.dart';
import 'package:pharnacy_trust/inner_screens/orders_screen/order_screen_view.dart';
import 'package:pharnacy_trust/inner_screens/wishList_screen/wish_list.dart';
import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:pharnacy_trust/screens/Auth/log_in.dart';
import 'package:pharnacy_trust/screens/cart/product_details/product_details.dart';
import 'package:pharnacy_trust/screens/cart/widget/card_screen.dart';

import 'package:provider/provider.dart';
import 'inner_screens/viewd_screen/viewd_screen_body.dart';
import 'screens/btn_nav_bar.dart';

class PharmacyEntryPoint extends StatefulWidget {
  const PharmacyEntryPoint({super.key});

  @override
  State<PharmacyEntryPoint> createState() => _PharmacyEntryPointState();
}

class _PharmacyEntryPointState extends State<PharmacyEntryPoint> {
  DarkThemeProvider darkThemeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    darkThemeProvider.darkTheme =
        await darkThemeProvider.darkThemePrefs.getDarkTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DarkThemeProvider>(
      create: (_) {
        return darkThemeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (context, darkThemeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Prime Care',
            theme: Styles.themeData(darkThemeProvider.darkTheme, context),
            home: const LogIn(),
            routes: {
              OnSaleScreens.routeName: (ctx) => const OnSaleScreens(),
              ProductsScreen.routeName: (ctx) => const ProductsScreen(),
              ProductDetails.routeName: (ctx) => const ProductDetails(),
              CartView.routeName: (ctx) => const CartView(),
              WishList.routeName: (ctx) => const WishList(),
              OrderScreenView.routeName: (ctx) => const OrderScreenView(),
              ViewdScreenBody.routeName: (ctx) => const ViewdScreenBody(),
              BtnNavBar.routeName: (ctx) => const BtnNavBar(),
            },
          );
        },
      ),
    );
  }
}
