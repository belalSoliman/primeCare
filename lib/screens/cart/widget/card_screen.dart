import 'package:flutter/material.dart';
import 'package:pharnacy_trust/screens/cart/widget/cart_widgets.dart';
import 'package:pharnacy_trust/screens/cart/widget/payment_summery.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return const CartWidgets();
              },
            ),
          ),
          const SizedBox(height: 10),
          PaymentSummary(),
        ],
      ),
    );
  }
}
