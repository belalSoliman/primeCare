import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pharnacy_trust/consts/firebase_auth.dart';
import 'package:pharnacy_trust/models/product_model.dart';
import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:pharnacy_trust/provider/whist_list_provider.dart';
import 'package:pharnacy_trust/screens/cart/product_details/product_details.dart';
import 'package:pharnacy_trust/service/global_methods.dart';
import 'package:provider/provider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.width = 140,
    this.aspectRetio = 1.02,
  });

  final double width, aspectRetio;

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
              aspectRatio: aspectRetio,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: darkThemeProvider.darkTheme
                      ? Colors.grey[300]
                      : const Color(0xFF979797).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: FancyShimmerImage(
                  imageUrl: productModel.images, // Network image URL
                  boxFit: BoxFit.cover,
                  errorWidget: const Icon(Icons.error,
                      color:
                          Colors.red), // Error icon if the image fails to load
                  shimmerBaseColor: Colors.grey[300]!,
                  shimmerHighlightColor: Colors.grey[100]!,
                  shimmerBackColor: Colors.grey[200]!,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${productModel.isonsale ? discountedPrice.toStringAsFixed(2) : productModel.price.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFF7643),
                  ),
                ),
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
                )
              ],
            ),
            Row(children: [
              productModel.isonsale
                  ? Text("\$${productModel.price.toStringAsFixed(2)}",
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
                productModel.isStrip ? "Strip" : "Box",
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
