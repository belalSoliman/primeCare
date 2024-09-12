import 'package:flutter/material.dart';
import 'package:pharnacy_trust/models/cart_model.dart';
import 'package:pharnacy_trust/provider/cart_provider.dart';
import 'package:pharnacy_trust/provider/product_provider.dart';
import 'package:pharnacy_trust/screens/cart/widget/cart_widgets.dart';
import 'package:pharnacy_trust/screens/cart/widget/empty_cart.dart';
import 'package:pharnacy_trust/screens/cart/widget/payment_btn.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const routeName = '/CartView';

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final cartItems =
        cartProvider.getCartItems.values.toList().reversed.toList();
    Map<String, double> calculateTotalAmountAndDiscount(
        ProductProvider productProvider, List<CartModel> cartItems) {
      double totalAmount = 0.0;
      double totalDiscount = 0.0;

      for (var cartItem in cartItems) {
        // Fetch the product details using the product ID in the cart item
        final product = productProvider.findProductById(cartItem.productid);

        if (product != null) {
          final hasDiscount =
              product.isonsale && product.discountPercentage > 0;
          final originalPrice = product.price;
          final discountedPrice = hasDiscount
              ? originalPrice -
                  (originalPrice * product.discountPercentage / 100)
              : originalPrice;

          totalAmount += discountedPrice * cartItem.quantity;

          if (hasDiscount) {
            totalDiscount +=
                (originalPrice - discountedPrice) * cartItem.quantity;
          }
        }
      }

      return {
        'totalAmount': totalAmount,
        'totalDiscount': totalDiscount,
      };
    }

    // Calculate the total amount and discount
    final totals = calculateTotalAmountAndDiscount(productProvider, cartItems);

    // Extract the total amount and discount from the map
    final totalAmount = totals['totalAmount'] ?? 0.0;
    final totalDiscount = totals['totalDiscount'] ?? 0.0;

    return Scaffold(
      body: cartItems.isEmpty
          ? const EmptyCart()
          : Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Tooltip(
                    message: 'Clear all items from the cart',
                    child: IconButton(
                      onPressed: () async {
                        final shouldClear = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text(
                              'Clear Cart',
                              style: TextStyle(color: Colors.red),
                            ),
                            content: const Text(
                                'Are you sure you want to clear all items from the cart?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text(
                                  'Clear',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );
                        if (shouldClear == true) {
                          cartProvider.clearCart();
                        }
                      },
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ChangeNotifierProvider.value(
                        value: cartItems[index],
                        child: const CartWidgets(),
                      );
                    },
                  ),
                ),
                PaymentBtn(
                  totalAmount: totalAmount, // Pass the extracted total amount
                  totalDiscount:
                      totalDiscount, // Pass the extracted total discount
                ),
                const SizedBox(height: 20),
              ],
            ),
    );
  }
}
