import 'package:flutter/material.dart';

class ViewdProductModel with ChangeNotifier {
  final String id;
  final String productid;
  ViewdProductModel({
    required this.id,
    required this.productid,
  });
}
