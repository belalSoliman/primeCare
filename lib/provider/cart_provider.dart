import 'package:flutter/foundation.dart';
import 'package:pharnacy_trust/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartModel> _cartItems = {};

  Map<String, CartModel> get getCartItems {
    return _cartItems;
  }

  void addProductToCart({required int productId}) {
    String productKey = productId.toString(); // Convert productId to String

    if (_cartItems.containsKey(productKey)) {
      _cartItems.update(
        productKey,
        (value) => CartModel(
          id: DateTime.now().toString(),
          productid: productId,
          // Assuming you want to increment quantity
        ),
      );
    } else {
      _cartItems.putIfAbsent(
        productKey,
        () => CartModel(
          id: DateTime.now().toString(),
          productid: productId,
        ),
      );
    }
    notifyListeners();
  }
}
