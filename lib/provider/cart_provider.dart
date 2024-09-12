import 'package:flutter/foundation.dart';
import 'package:pharnacy_trust/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartModel> cartItems = {};

  Map<String, CartModel> get getCartItems {
    return cartItems;
  }

  void addProductToCart({required String productId}) {
    String productKey = productId.toString(); // Convert productId to String

    if (cartItems.containsKey(productKey)) {
      cartItems.update(
        productKey,
        (value) => CartModel(
          id: DateTime.now().toString(),
          productid: productId,

          // Assuming you want to increment quantity
        ),
      );
    } else {
      cartItems.putIfAbsent(
        productKey,
        () => CartModel(
          id: DateTime.now().toString(),
          productid: productId,
        ),
      );
    }
    notifyListeners();
  }

  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }

  void removeProductFromCart({required String productId}) {
    cartItems.remove(productId);
    notifyListeners();
  }
}
