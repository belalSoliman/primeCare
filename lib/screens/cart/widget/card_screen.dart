import 'package:flutter/material.dart';
import 'package:pharnacy_trust/screens/cart/widget/cart_widgets.dart';
import 'package:pharnacy_trust/screens/cart/widget/empty_cart.dart';
import 'package:pharnacy_trust/screens/cart/widget/payment_btn.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const routeName = '/CartView';

  @override
  Widget build(BuildContext context) {
    bool _isempty = true;
    return _isempty
        ? const EmptyCart()
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return const CartWidgets();
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
