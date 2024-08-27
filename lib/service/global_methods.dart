import 'package:flutter/material.dart';
import 'package:pharnacy_trust/inner_screens/on_sale_screens.dart';

class GlobalMethods {
  navigateTo({required BuildContext ctx, required String routeName}) {
    Navigator.pushNamed(ctx, routeName);
  }
}
