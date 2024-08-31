import 'package:flutter/material.dart';
import 'package:pharnacy_trust/inner_screens/orders_screen.dart/oder_item.dart';

class OrderScreenView extends StatelessWidget {
  const OrderScreenView({super.key});
  static const routeName = '/OrderScreenView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: const OrderItem(),
    );
  }
}
