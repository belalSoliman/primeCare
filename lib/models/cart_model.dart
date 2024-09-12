import 'package:flutter/foundation.dart';

class CartModel with ChangeNotifier {
  final String id;
  final String productid;
  int quantity; // Add quantity field

  CartModel({
    required this.id,
    required this.productid,
    this.quantity = 1, // Default quantity is 1
  });
}
