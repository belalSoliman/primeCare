import 'package:flutter/material.dart';
import 'package:pharnacy_trust/provider/cart_provider.dart';
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
    final cartItems =
        cartProvider.getCartItems.values.toList().reversed.toList();

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
                        child: CartWidgets(),
                      );
                    },
                  ),
                ),
                const PaymentBtn(),
                const SizedBox(height: 20),
              ],
            ),
    );
  }
}
