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
    final cartItems = cartProvider.getCartItems.values.toList();

    print(cartItems);

    return cartItems.isEmpty
        // ignore: dead_code
        ? const EmptyCart()
        // ignore: dead_code
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChangeNotifierProvider.value(
                        value: cartItems[index], child: CartWidgets());
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: PaymentBtn(),
              ),
              const SizedBox(height: 10),
            ],
          );
  }
}
