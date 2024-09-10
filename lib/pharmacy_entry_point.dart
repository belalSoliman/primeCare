import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pharnacy_trust/consts/theme_data.dart';
import 'package:pharnacy_trust/inner_screens/category_filterd_Screen.dart/category_filter_screen.dart';
import 'package:pharnacy_trust/inner_screens/feeds_screen_all_product.dart';
import 'package:pharnacy_trust/inner_screens/on_sale_screens.dart';
import 'package:pharnacy_trust/inner_screens/orders_screen/order_screen_view.dart';
import 'package:pharnacy_trust/inner_screens/wishList_screen/wish_list.dart';
import 'package:pharnacy_trust/provider/cart_provider.dart';
import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:pharnacy_trust/provider/product_provider.dart';
import 'package:pharnacy_trust/provider/view_product.dart';
import 'package:pharnacy_trust/provider/whist_list_provider.dart';
import 'package:pharnacy_trust/screens/Auth/forget_password.dart';
import 'package:pharnacy_trust/screens/Auth/log_in.dart';
import 'package:pharnacy_trust/screens/Auth/sign_up.dart';
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
  final DarkThemeProvider darkThemeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    final isDarkTheme = await darkThemeProvider.darkThemePrefs.getDarkTheme();
    if (mounted) {
      setState(() {
        darkThemeProvider.darkTheme = isDarkTheme;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> firebaseInit = Firebase.initializeApp();
    return FutureBuilder(
      future: firebaseInit,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Error initializing Firebase'),
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          // Firebase is initialized successfully, so build the main app
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<DarkThemeProvider>.value(
                value: darkThemeProvider,
              ),
              ChangeNotifierProvider(create: (_) => ProductProvider()),
              ChangeNotifierProvider(create: (_) => CartProvider()),
              ChangeNotifierProvider(create: (_) => WhistListProvider()),
              ChangeNotifierProvider(create: (_) => ViewProduct1()),
            ],
            child: Consumer<DarkThemeProvider>(
              builder: (context, darkThemeProvider, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Prime Care',
                  theme: Styles.themeData(darkThemeProvider.darkTheme, context),
                  home: const BtnNavBar(),
                  routes: {
                    OnSaleScreens.routeName: (ctx) => const OnSaleScreens(),
                    ProductsScreen.routeName: (ctx) => const ProductsScreen(),
                    ProductDetails.routeName: (ctx) => const ProductDetails(),
                    CartView.routeName: (ctx) => const CartView(),
                    WishList.routeName: (ctx) => const WishList(),
                    OrderScreenView.routeName: (ctx) => const OrderScreenView(),
                    ViewdScreenBody.routeName: (ctx) => const ViewdScreenBody(),
                    BtnNavBar.routeName: (ctx) => const BtnNavBar(),
                    SignUp.routeName: (ctx) => const SignUp(),
                    ForgetPassword.routeName: (ctx) => const ForgetPassword(),
                    CategoryFilterScreen.routeName: (ctx) =>
                        const CategoryFilterScreen(),
                    LogIn.routeName: (ctx) => const LogIn(),
                  },
                );
              },
            ),
          );
        } else {
          // Should never get here, but just in case
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Unexpected state'),
              ),
            ),
          );
        }
      },
    );
  }
}
