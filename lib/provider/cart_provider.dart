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
      // If the product is already in the cart, increment its quantity
      cartItems.update(
        productKey,
        (existingCartItem) => CartModel(
          id: existingCartItem.id,
          productid: existingCartItem.productid,
          quantity: existingCartItem.quantity + 1, // Increment quantity
        ),
      );
    } else {
      // If the product is not in the cart, add it with quantity 1
      cartItems.putIfAbsent(
        productKey,
        () => CartModel(
          id: DateTime.now().toString(),
          productid: productId,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void decreaseProductQuantity({required String productId}) {
    String productKey = productId.toString();

    if (cartItems.containsKey(productKey)) {
      final currentQuantity = cartItems[productKey]!.quantity;

      if (currentQuantity > 1) {
        // Decrease quantity by 1 if more than 1
        cartItems.update(
          productKey,
          (existingCartItem) => CartModel(
            id: existingCartItem.id,
            productid: existingCartItem.productid,
            quantity: currentQuantity - 1,
          ),
        );
      } else {
        // If quantity is 1, remove the product from the cart
        cartItems.remove(productKey);
      }
      notifyListeners();
    }
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
