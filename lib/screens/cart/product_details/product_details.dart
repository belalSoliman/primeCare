import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'package:pharnacy_trust/provider/cart_provider.dart';
import 'package:pharnacy_trust/provider/product_provider.dart';

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
    final productList = Provider.of<ProductProvider>(context);
    final productId = ModalRoute.of(context)!.settings.arguments as int;
    final getCurrentProduct = productList.findProductById(productId);
    final addToCartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(IconlyBold.arrow_left, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(IconlyLight.heart, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Title and Subtitle
            Text(
              getCurrentProduct.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            // Product Image
            Center(
              child: Image.asset(
                getCurrentProduct.images,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${getCurrentProduct.price}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    getCurrentProduct.isonsale
                        ? Text(
                            '\$${getCurrentProduct.discountPercentage}',
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: isAddedToCart
                      ? null
                      : () {
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
                        ? Colors.blueAccent
                        : Colors.green.shade400,
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
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),

            Text(
              'Category: ${getCurrentProduct.category}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
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
