import 'package:flutter/material.dart';
import 'package:pharnacy_trust/models/cart_model.dart';

import 'package:pharnacy_trust/provider/cart_provider.dart';
import 'package:pharnacy_trust/provider/product_provider.dart';

import 'package:pharnacy_trust/screens/cart/widget/counter_widget_cart.dart';
import 'package:pharnacy_trust/screens/cart/product_details/product_details.dart';

import 'package:provider/provider.dart';

class CartWidgets extends StatefulWidget {
  const CartWidgets({super.key});

  @override
  State<CartWidgets> createState() => _CartWidgetsState();
}

class _CartWidgetsState extends State<CartWidgets> {
  int count = 0;
  // Start with 1 as default

  void incrementCounter() {
    setState(() {
      count++;
    });
  }

  void decrementCounter() {
    setState(() {
      if (count > 1) {
        // Ensure count doesn't go below 1
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartModel>(context);
    final productItems = Provider.of<ProductProvider>(context);
    final getcurrentProduct =
        productItems.findProductById(cartProvider.productid);
    final cartProvider2 = Provider.of<CartProvider>(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ProductDetails.routeName,
                  arguments: getcurrentProduct.id);
            },
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(getcurrentProduct.images),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getcurrentProduct.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          getcurrentProduct.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      getcurrentProduct.isonsale
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$${getcurrentProduct.price.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors
                                        .grey, // Use a neutral color for the original price
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration
                                        .lineThrough, // Strikethrough for original price
                                  ),
                                ),
                                Text(
                                  "\$${getcurrentProduct.discountPercentage}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          : SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Text(
                                "\$${(getcurrentProduct.price * count).toStringAsFixed(2)}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.purple.shade700,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8, top: 8),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      cartProvider2.removeProductFromCart(
                          productId: getcurrentProduct.id.toString());
                    });
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ),
              const Spacer(),
              CounterWidgetCart(
                count: count,
                onIncrement: incrementCounter,
                onDecrement: decrementCounter,
              ),
              const SizedBox(
                height: 5,
              )
            ],
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
