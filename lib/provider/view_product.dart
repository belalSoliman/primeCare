import 'package:flutter/material.dart';
import 'package:pharnacy_trust/models/viewd_product_model.dart';

class ViewProduct1 with ChangeNotifier {
  Map<String, ViewdProductModel> _viewProduct1 = {};

  Map<String, ViewdProductModel> get viewProduct1 => _viewProduct1;
  void addRemoveProductToView({required String productId}) {
    _viewProduct1.putIfAbsent(
        productId,
        () => ViewdProductModel(
            id: DateTime.now().toString(), productid: productId));

    notifyListeners();
  }

  void clearViewProduct1() {
    _viewProduct1.clear();
    notifyListeners();
  }
}
