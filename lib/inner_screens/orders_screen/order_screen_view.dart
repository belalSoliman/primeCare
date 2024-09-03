import 'package:flutter/material.dart';
import 'package:pharnacy_trust/inner_screens/orders_screen/empty_order_screen.dart';
import 'package:pharnacy_trust/inner_screens/orders_screen/oder_item.dart';

class OrderScreenView extends StatelessWidget {
  const OrderScreenView({super.key});
  static const routeName = '/OrderScreenView';
  @override
  Widget build(BuildContext context) {
    bool isempty = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: isempty
          ? const EmptyOrderScreen()
          // ignore: dead_code
          : ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const OrderItem();
              }),
    );
  }
}
