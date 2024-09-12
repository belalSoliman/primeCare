import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:iconly/iconly.dart';

import 'package:pharnacy_trust/consts/firebase_auth.dart';
import 'package:pharnacy_trust/models/product_model.dart';
import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:pharnacy_trust/provider/whist_list_provider.dart';
import 'package:pharnacy_trust/screens/cart/product_details/product_details.dart';
import 'package:pharnacy_trust/service/global_methods.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.width = 140,
    this.aspectRatio = 1.2,
  });

  final double width, aspectRatio;

  @override
  Widget build(BuildContext context) {
    // Access the providers
    final darkThemeProvider = Provider.of<DarkThemeProvider>(context);
    final productModel = Provider.of<ProductModel>(context);
    final wishListProvider = Provider.of<WhistListProvider>(context);
    final User? user = authinstance.currentUser;

    // Check if the product is in the wishlist
    bool? isInWishList =
        wishListProvider.whistList.containsKey(productModel.id.toString());

    // Calculate the discounted price
    final discountedPrice = productModel.price -
        (productModel.price * (productModel.discountPercentage / 100));

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: darkThemeProvider.darkTheme ? Colors.grey[300] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      width: width,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            ProductDetails.routeName,
            arguments: productModel.id,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: aspectRatio,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: darkThemeProvider.darkTheme
                      ? Colors.grey[300]
                      : const Color(0xFF979797).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FancyShimmerImage(
                    imageUrl: productModel.images,
                    boxFit: BoxFit.fill,
                    errorWidget: const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    shimmerBaseColor: Colors.grey[300]!,
                    shimmerHighlightColor: Colors.grey[100]!,
                    shimmerBackColor: Colors.grey[200]!,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              productModel.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  "\$${productModel.isonsale ? discountedPrice.toStringAsFixed(2) : productModel.price.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFF7643),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    if (user == null) {
                      GlobalMethods.errorDialog(
                        ctx: context,
                        subtitle: "Please login first",
                        title: "Error",
                      );
                      return;
                    }
                    wishListProvider.addProductToWhistList(
                        productId: productModel.id.toString());
                  },
                  child: Icon(
                    isInWishList ? IconlyBold.heart : IconlyLight.heart,
                    color: isInWishList ? Colors.green : Colors.black,
                    size: 26,
                  ),
                ),
              ],
            ),
            if (productModel.isonsale) ...[
              const SizedBox(height: 4),
              Text(
                "\$${productModel.price.toStringAsFixed(2)}",
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.lineThrough,
                  decorationThickness: 2,
                  decorationColor: Colors.red,
                ),
              ),
            ],
            const SizedBox(height: 4),
            Text(
              productModel.isStrip ? "Strip" : "Box",
              style: const TextStyle(
                color: Color(0xFF979797),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
