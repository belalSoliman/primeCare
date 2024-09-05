import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pharnacy_trust/models/wish_list_model.dart';

import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:pharnacy_trust/provider/product_provider.dart';
import 'package:pharnacy_trust/provider/whist_list_provider.dart';
import 'package:pharnacy_trust/screens/cart/product_details/product_details.dart';
import 'package:pharnacy_trust/service/global_methods.dart';

import 'package:provider/provider.dart';

class WishListItem extends StatelessWidget {
  const WishListItem({super.key});

  @override
  Widget build(BuildContext context) {
    DarkThemeProvider darkThemeProvider = DarkThemeProvider();
    GlobalMethods globalMethods = GlobalMethods();

    final _productModel = Provider.of<ProductProvider>(context);
    final _whistListProvider = Provider.of<WhistListProvider>(context);
    final _whistListModel = Provider.of<WishListModel>(context);
    final getCurrentProduct =
        _productModel.findProductById(int.parse(_whistListModel.productid));

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetails.routeName,
            arguments: getCurrentProduct.id);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
          color: darkThemeProvider.darkTheme ? Colors.grey[300] : Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          // Make the container fit its children
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
                getCurrentProduct.images,
                width: double.infinity, // Make the image responsive
                fit: BoxFit
                    .contain, // Ensure the image covers the available space
              ),
            ),
            const SizedBox(height: 8),
            Container(
              color:
                  darkThemeProvider.darkTheme ? Colors.grey[300] : Colors.white,
              child: Text(
                getCurrentProduct.title,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 2,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "\$20",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFF7643),
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                _whistListProvider.addProductToWhistList(
                    productId: getCurrentProduct.id.toString());
              },
              child: Icon(
                IconlyBold.heart,
                color: Colors.green,
                size: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
