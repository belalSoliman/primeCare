import 'package:flutter/material.dart';
import 'package:pharnacy_trust/screens/cart/widget/cart_widgets.dart';
import 'package:pharnacy_trust/screens/cart/widget/empty_cart.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return const CartWidgets();
      },
    );
  }
}
