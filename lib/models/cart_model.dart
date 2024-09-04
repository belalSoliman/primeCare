import 'package:flutter/foundation.dart';

class CartModel with ChangeNotifier {
  final String id;
  final int productid;

  CartModel({required this.id, required this.productid});
}
