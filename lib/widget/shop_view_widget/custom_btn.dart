import 'package:flutter/material.dart';

import 'package:pharnacy_trust/widget/shop_view_widget/card_icon.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: CardIcon(),
      ),
    );
  }
}
