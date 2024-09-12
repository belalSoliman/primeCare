import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pharnacy_trust/models/wish_list_model.dart';
import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:pharnacy_trust/provider/product_provider.dart';
import 'package:pharnacy_trust/provider/whist_list_provider.dart';
import 'package:pharnacy_trust/screens/cart/product_details/product_details.dart';
import 'package:provider/provider.dart';

class WishListItem extends StatelessWidget {
  const WishListItem({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the providers
    final darkThemeProvider = Provider.of<DarkThemeProvider>(context);
    final productModel = Provider.of<ProductProvider>(context);
    final whistListProvider = Provider.of<WhistListProvider>(context);
    final whistListModel = Provider.of<WishListModel>(context);
    final getCurrentProduct =
        productModel.findProductById(whistListModel.productid);

    // Calculate the discounted price if the product is on sale
    final discountedPrice = getCurrentProduct.price -
        (getCurrentProduct.price *
            (getCurrentProduct.discountPercentage / 100));

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                color: darkThemeProvider.darkTheme
                    ? Colors.grey[300]
                    : const Color(0xFF979797).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(
                getCurrentProduct.images,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // Product Title
            Text(
              getCurrentProduct.title,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            // Pricing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${getCurrentProduct.isonsale ? discountedPrice.toStringAsFixed(2) : getCurrentProduct.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF7643),
                      ),
                    ),
                    if (getCurrentProduct.isonsale)
                      Text(
                        '\$${getCurrentProduct.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    whistListProvider.addProductToWhistList(
                        productId: getCurrentProduct.id.toString());
                  },
                  child: const Icon(
                    IconlyBold.heart,
                    color: Colors.green,
                    size: 26,
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
