import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pharnacy_trust/consts/firebase_auth.dart';
import 'package:pharnacy_trust/provider/cart_provider.dart';
import 'package:pharnacy_trust/provider/product_provider.dart';
import 'package:pharnacy_trust/provider/view_product.dart';
import 'package:pharnacy_trust/provider/whist_list_provider.dart';
import 'package:pharnacy_trust/service/global_methods.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});
  static const routeName = '/product-details';

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  GlobalMethods globalMethods = GlobalMethods();
  bool isAddedToCart = false;

  @override
  Widget build(BuildContext context) {
    final wishListProvider = Provider.of<WhistListProvider>(context);
    final productList = Provider.of<ProductProvider>(context);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrentProduct = productList.findProductById(productId);
    final addToCartProvider = Provider.of<CartProvider>(context);
    final viewProductModel = Provider.of<ViewProduct1>(context);

    bool? isInWishList =
        wishListProvider.whistList.containsKey(getCurrentProduct.id);

    // Calculate the discounted price
    final discountedPrice = getCurrentProduct.price -
        (getCurrentProduct.price *
            (getCurrentProduct.discountPercentage / 100));

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: const Icon(IconlyBold.arrow_left, color: Colors.black),
          onPressed: () {
            viewProductModel.addRemoveProductToView(
                productId: getCurrentProduct.id);
            Navigator.pop(context);
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
              final User? user = authinstance.currentUser;
              if (user == null) {
                GlobalMethods.errorDialog(
                  ctx: context,
                  subtitle: "Please login first",
                  title: "Error",
                );
                return;
              }
              wishListProvider.addProductToWhistList(
                  productId: getCurrentProduct.id);
            },
            child: Icon(
              isInWishList ? IconlyBold.heart : IconlyLight.heart,
              color: isInWishList
                  ? Theme.of(context).colorScheme.primary
                  : Colors.black,
              size: 26,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Title
            Text(
              getCurrentProduct.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 16),

            // Product Image
            Center(
              child: Image.network(
                getCurrentProduct.images,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
            ),
            const SizedBox(height: 16),

            // Pricing and Add to Cart
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${getCurrentProduct.isonsale ? discountedPrice.toStringAsFixed(2) : getCurrentProduct.price.toStringAsFixed(2)}',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    if (getCurrentProduct.isonsale)
                      Row(
                        children: [
                          Text(
                            '\$${getCurrentProduct.price.toStringAsFixed(2)}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '-${getCurrentProduct.discountPercentage.toStringAsFixed(0)}%',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: isAddedToCart
                      ? null
                      : () {
                          final User? user = authinstance.currentUser;
                          if (user == null) {
                            GlobalMethods.errorDialog(
                              ctx: context,
                              subtitle: "Please login first",
                              title: "Error",
                            );
                            return;
                          }
                          addToCartProvider.addProductToCart(
                            productId: getCurrentProduct.id,
                          );
                          setState(() {
                            isAddedToCart = true;
                          });
                        },
                  icon: isAddedToCart
                      ? const Icon(IconlyLight.tick_square,
                          size: 18, color: Colors.white)
                      : const Icon(IconlyLight.buy,
                          size: 18, color: Colors.white),
                  label: Text(
                    isAddedToCart ? 'Added' : 'Add to cart',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isAddedToCart
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            const Text(
              'Product Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              getCurrentProduct.description,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[700],
                  ),
            ),
            const SizedBox(height: 24),

            Text(
              'Category: ${getCurrentProduct.category}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Continue Shopping',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
