import 'package:flutter/material.dart';
import 'package:pharnacy_trust/screens/cart/widget/cart_widgets.dart';
import 'package:pharnacy_trust/screens/cart/widget/payment_btn.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const routeName = '/CartView';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              return const CartWidgets();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: const PaymentBtn(),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
