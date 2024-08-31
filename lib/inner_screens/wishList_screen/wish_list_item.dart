import 'package:flutter/material.dart';
import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:pharnacy_trust/screens/cart/product_details/product_details.dart';
import 'package:pharnacy_trust/service/global_methods.dart';
import 'package:pharnacy_trust/widget/shop_view_widget/card_icon.dart';
import 'package:pharnacy_trust/widget/shop_view_widget/heart_widget.dart';

class WishListItem extends StatelessWidget {
  const WishListItem({super.key});

  @override
  Widget build(BuildContext context) {
    DarkThemeProvider darkThemeProvider = DarkThemeProvider();
    GlobalMethods globalMethods = GlobalMethods();

    return GestureDetector(
      onTap: () {
        globalMethods.navigateTo(
          ctx: context,
          routeName: ProductDetails.routeName,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
          color: darkThemeProvider.darkTheme ? Colors.grey[300] : Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Make the container fit its children
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: darkThemeProvider.darkTheme
                    ? Colors.grey[300]
                    : const Color(0xFF979797).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                'assets/category_assets/cat-2.png',
                width: double.infinity, // Make the image responsive
                fit:
                    BoxFit.cover, // Ensure the image covers the available space
              ),
            ),
            const SizedBox(height: 8),
            Container(
              color:
                  darkThemeProvider.darkTheme ? Colors.grey[300] : Colors.white,
              child: Text(
                "Product Name",
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 2,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "\$20",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFF7643),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: const Row(
                    children: [
                      CardIcon(),
                      SizedBox(width: 8),
                      const HeartWidget()
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
