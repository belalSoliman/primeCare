import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pharnacy_trust/models/product_model.dart';
import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:pharnacy_trust/provider/whist_list_provider.dart';
import 'package:pharnacy_trust/screens/cart/product_details/product_details.dart';

import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.width = 140,
    this.aspectRetio = 1.02,
  });

  final double width, aspectRetio;

  @override
  Widget build(BuildContext context) {
    DarkThemeProvider darkThemeProvider =
        Provider.of<DarkThemeProvider>(context);
    final productModel = Provider.of<ProductModel>(context);
    final wishListProvider = Provider.of<WhistListProvider>(context);
    bool? _isInWishList =
        wishListProvider.whistList.containsKey(productModel.id.toString());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      color: darkThemeProvider.darkTheme ? Colors.grey[300] : Colors.white,
      width: width,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ProductDetails.routeName,
              arguments: productModel.id);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: darkThemeProvider.darkTheme
                      ? Colors.grey[300]
                      : const Color(0xFF979797).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  productModel.images,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              color:
                  darkThemeProvider.darkTheme ? Colors.grey[300] : Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productModel.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${productModel.price}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFF7643),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    wishListProvider.addProductToWhistList(
                        productId: productModel.id.toString());
                  },
                  child: Icon(
                    _isInWishList ? IconlyBold.heart : IconlyLight.heart,
                    color: _isInWishList ? Colors.green : Colors.black,
                    size: 26,
                  ),
                )
              ],
            ),
            Row(children: [
              productModel.isonsale
                  ? Text("\$${productModel.discountPercentage}",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 2,
                            decorationColor: Colors.red,
                          ))
                  : const SizedBox.shrink(),
              const Spacer(),
              Text(
                productModel.isStrip ? "strip" : "Box",
                style: const TextStyle(
                    color: Color(0xFF979797),
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
