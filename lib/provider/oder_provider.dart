import 'package:flutter/material.dart';
import 'package:pharnacy_trust/models/order_model.dart';

class OderProvider with ChangeNotifier {
  static List<Ordermodel> orders = [];
  List<Ordermodel> get getOrders => orders;
}
