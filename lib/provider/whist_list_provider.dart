import 'package:flutter/material.dart';

import 'package:pharnacy_trust/models/wish_list_model.dart';

class WhistListProvider with ChangeNotifier {
  Map<String, WishListModel> _whistList = {};

  Map<String, WishListModel> get whistList => _whistList;

  void addProductToWhistList({required String productId}) {
    if (_whistList.containsKey(productId)) {
      removeProductFromWhistList(productId: productId);
    } else {
      _whistList.putIfAbsent(
        productId,
        () => WishListModel(
          id: DateTime.now().toString(),
          productid: productId,
        ),
      );
    }

    notifyListeners();
  }

  void removeProductFromWhistList({required String productId}) {
    _whistList.remove(productId);
    notifyListeners();
  }

  void clearWhistList() {
    _whistList.clear();
    notifyListeners();
  }
}
