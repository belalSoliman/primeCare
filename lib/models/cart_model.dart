import 'package:flutter/foundation.dart';

class CartModel with ChangeNotifier {
  final String id;

  final String productid;

  CartModel({
    required this.id,
    required this.productid,
  });
}
