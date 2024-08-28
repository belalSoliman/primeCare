import 'package:flutter/material.dart';
import 'package:pharnacy_trust/inner_screens/feeds_screen_all_product.dart';
import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:pharnacy_trust/service/global_methods.dart';
import 'package:provider/provider.dart';

class ShopProductView extends StatelessWidget {
  const ShopProductView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethods = GlobalMethods();
    final darkThemeProvider = Provider.of<DarkThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Products",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: darkThemeProvider.darkTheme ? Colors.white : Colors.black,
            ),
          ),
          TextButton(
            onPressed: () {
              globalMethods.navigateTo(
                ctx: context,
                routeName: ProductsScreen.routeName,
              );
            },
            child: const Text(
              "View All",
              style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}
