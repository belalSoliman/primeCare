import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharnacy_trust/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> get getProducts {
    return _products;
  }

  List<ProductModel> get getOnSaleProducts {
    return _products.where((element) => element.isonsale == true).toList();
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

  static final List<ProductModel> _products = [
    ProductModel(
        id: 1,
        title: "pandol",
        images: "assets/samples/PanadolColdandFluAllinOneCaplets24s__79972.jpg",
        category: "vitamin",
        price: 5.99,
        discountPercentage: 2.3,
        description: "pandol  Cold and Flu All in One Caplets 24s for women ",
        isonsale: false,
        isStrip: false),
    ProductModel(
        id: 2,
        title: "insulin",
        images: "assets/samples/PanadolColdandFluAllinOneCaplets24s__79972.jpg",
        category: "vitamin D",
        price: 55.99,
        discountPercentage: 22.3,
        description:
            " vitamin D  Cold and Flu All in One Caplets 24s for women ",
        isonsale: false,
        isStrip: true),
    ProductModel(
        id: 3,
        title: "anti flow",
        images: "assets/samples/vitamin-d-5-5000.png",
        category: "cosmatics",
        price: 521.99,
        discountPercentage: 2.3,
        description: "pandol  Cold and Flu All in One Caplets 24s for women ",
        isonsale: false,
        isStrip: false),
    ProductModel(
        id: 5,
        title: "pandol",
        images: "assets/samples/news-insulin-1440px.jpg",
        category: "belal",
        price: 212.99,
        discountPercentage: 21212.3,
        description: "kos om akrm  ",
        isonsale: false,
        isStrip: true),
    ProductModel(
        id: 6,
        title: "pandol",
        images: "assets/samples/PanadolColdandFluAllinOneCaplets24s__79972.jpg",
        category: "7amada",
        price: 0101.99,
        discountPercentage: 2.3,
        description: "pandol  Cold and Flu All in One Caplets 24s for women ",
        isonsale: false,
        isStrip: true),
    ProductModel(
        id: 7,
        title: "pandol",
        images: "assets/samples/PanadolColdandFluAllinOneCaplets24s__79972.jpg",
        category: "7amada",
        price: 5.99,
        discountPercentage: 2.3,
        description: "pandol  Cold and Flu All in One Caplets 24s for women ",
        isonsale: false,
        isStrip: false),
    ProductModel(
        id: 8,
        title: "erqwerqweqwe",
        images: "assets/category_assets/sushi (1).png",
        category: "insulin",
        price: 5.99,
        discountPercentage: 2.3,
        description: "pandol  Cold and Flu All in One Caplets 24s for women ",
        isonsale: false,
        isStrip: false),
  ];
}
