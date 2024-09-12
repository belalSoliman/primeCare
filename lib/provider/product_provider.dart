import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharnacy_trust/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  static final List<ProductModel> _products = [];
  List<ProductModel> get getProducts {
    return _products;
  }

  List<ProductModel> get getOnSaleProducts {
    return _products.where((element) => element.isonsale == true).toList();
  }

  Future<void> fetchProducts() async {
    await FirebaseFirestore.instance
        .collection("products")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _products.insert(
            0,
            ProductModel(
                id: doc.get("productId"),
                title: doc.get("title"),
                images: doc.get("images"),
                category: doc.get("category"),
                price: doc.get("price"),
                discountPercentage: doc.get("discountPercentage"),
                description: doc.get("description"),
                isonsale: doc.get("isOnSale"),
                isStrip: doc.get("isStrip")));
      });
    });

    notifyListeners();
  }

  List<ProductModel> findByCategory(String categoryName) {
    List<ProductModel> categoryList = _products
        .where((element) =>
            element.category.toLowerCase().contains(categoryName.toLowerCase()))
        .toList();
    return categoryList;
  }

  ProductModel findProductById(int id) {
    return _products.firstWhere((element) => element.id == id);
  }
}
