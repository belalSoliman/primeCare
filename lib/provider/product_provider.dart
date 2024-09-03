import 'package:flutter/material.dart';
import 'package:pharnacy_trust/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> get getProducts {
    return _products;
  }

  List<ProductModel> get getOnSaleProducts {
    return _products.where((element) => element.isonsale == true).toList();
  }

  ProductModel findProductById(int id) {
    return _products.firstWhere((element) => element.id == id);
  }

  static final List<ProductModel> _products = [
    ProductModel(
        id: 1,
        title: "pandol",
        images: "assets/samples/PanadolColdandFluAllinOneCaplets24s__79972.jpg",
        category: "antibacterial",
        price: 5.99,
        discountPercentage: 2.3,
        description: "pandol  Cold and Flu All in One Caplets 24s for women ",
        isonsale: true,
        isStrip: false),
    ProductModel(
        id: 2,
        title: "hossam",
        images: "assets/samples/PanadolColdandFluAllinOneCaplets24s__79972.jpg",
        category: "vitamin D",
        price: 55.99,
        discountPercentage: 22.3,
        description:
            " vitamin D  Cold and Flu All in One Caplets 24s for women ",
        isonsale: true,
        isStrip: true),
    ProductModel(
        id: 3,
        title: "belal",
        images: "assets/samples/vitamin-d-5-5000.png",
        category: "antibacterial",
        price: 521.99,
        discountPercentage: 2.3,
        description: "pandol  Cold and Flu All in One Caplets 24s for women ",
        isonsale: true,
        isStrip: false),
    ProductModel(
        id: 5,
        title: "pandol",
        images: "assets/samples/news-insulin-1440px.jpg",
        category: "antibacterial",
        price: 212.99,
        discountPercentage: 21212.3,
        description: "kos om akrm  ",
        isonsale: true,
        isStrip: true),
    ProductModel(
        id: 6,
        title: "pandol",
        images: "assets/samples/PanadolColdandFluAllinOneCaplets24s__79972.jpg",
        category: "antibacterial",
        price: 0101.99,
        discountPercentage: 2.3,
        description: "pandol  Cold and Flu All in One Caplets 24s for women ",
        isonsale: true,
        isStrip: true),
    ProductModel(
        id: 7,
        title: "pandol",
        images: "assets/samples/PanadolColdandFluAllinOneCaplets24s__79972.jpg",
        category: "antibacterial",
        price: 5.99,
        discountPercentage: 2.3,
        description: "pandol  Cold and Flu All in One Caplets 24s for women ",
        isonsale: true,
        isStrip: false),
    ProductModel(
        id: 8,
        title: "erqwerqweqwe",
        images: "assets/category_assets/sushi (1).png",
        category: "antibacterial",
        price: 5.99,
        discountPercentage: 2.3,
        description: "pandol  Cold and Flu All in One Caplets 24s for women ",
        isonsale: true,
        isStrip: false),
  ];
}
