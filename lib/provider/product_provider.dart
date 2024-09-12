import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:pharnacy_trust/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  static final List<ProductModel> _products = [];
  List<ProductModel> get getProducts {
    return _products;
  }

  Future<void> fetchProducts() async {
    _products.clear();
    await FirebaseFirestore.instance
        .collection("products")
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        try {
          // Check if required fields exist
          final id = doc.get("productId");
          final title = doc.get("title");
          final images = doc.get("images");
          final category = doc.get("category");
          final price = doc.get("price");
          final discountPercentage = doc.get("discountPercentage");
          final description = doc.get("description");
          final isOnSale = doc.get("isOnSale");
          final isStrip = doc.get("isStrip");

          // Insert the product into the list
          _products.insert(
            0,
            ProductModel(
              id: id,
              title: title,
              images: images,
              category: category,
              price: price,
              discountPercentage: discountPercentage,
              description: description,
              isonsale: isOnSale,
              isStrip: isStrip,
            ),
          );
        } catch (e) {
          if (kDebugMode) {
            print('Error processing document with ID ${doc.id}: $e');
          }

          // Handle or log the error for this specific document, but continue processing others
        }
      }
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

  List<ProductModel> get getOnSaleProducts {
    return _products.where((element) => element.isonsale == true).toList();
  }

  ProductModel findProductById(String id) {
    return _products.firstWhere((element) => element.id == id);
  }

  List<ProductModel> searchQury(String searchTExt) {
    List<ProductModel> searchList = _products
        .where((element) => element.title.toLowerCase().contains(
              searchTExt.toLowerCase(),
            ))
        .toList();
    return searchList;
  }
}
