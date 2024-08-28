import 'package:flutter/material.dart';

class OnSaleScreens extends StatelessWidget {
  const OnSaleScreens({super.key});

  static const routeName = '/OnSaleScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('On Sale'),
      ),
      body: Center(
        child: Text('On Sale'),
      ),
    );
  }
}
