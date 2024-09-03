import 'package:flutter/material.dart';
import 'package:pharnacy_trust/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> get getProducts {
    return _products;
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
        isStrip: false),
    ProductModel(
        id: 3,
        title: "belal",
        images: "assets/samples/vitamin-d-5-5000.png",
        category: "antibacterial",
        price: 5.99,
        discountPercentage: 2.3,
        description: "pandol  Cold and Flu All in One Caplets 24s for women ",
        isonsale: true,
        isStrip: false),
    // ProductModel(
    //     id: 5,
    //     title: "pandol",
    //     images: "assets/samples/news-insulin-1440px.jpg",
    //     category: "antibacterial",
    //     price: 212.99,
    //     discountPercentage: 21212.3,
    //     description: "kos om akrm  ",
    //     isonsale: true,
    //     isStrip: false),
    // ProductModel(
    //     id: 1,
    //     title: "pandol",
    //     images: "assets/samples/PanadolColdandFluAllinOneCaplets24s__79972.jpg",
    //     category: "antibacterial",
    //     price: 5.99,
    //     discountPercentage: 2.3,
    //     description: "pandol  Cold and Flu All in One Caplets 24s for women ",
    //     isonsale: true,
    //     isStrip: false),
    // ProductModel(
    //     id: 1,
    //     title: "pandol",
    //     images: "assets/samples/PanadolColdandFluAllinOneCaplets24s__79972.jpg",
    //     category: "antibacterial",
    //     price: 5.99,
    //     discountPercentage: 2.3,
    //     description: "pandol  Cold and Flu All in One Caplets 24s for women ",
    //     isonsale: true,
    //     isStrip: false),
    // ProductModel(
    //     id: 1,
    //     title: "erqwerqweqwe",
    //     images: "assets/category_assets/cat-5.png",
    //     category: "antibacterial",
    //     price: 5.99,
    //     discountPercentage: 2.3,
    //     description: "pandol  Cold and Flu All in One Caplets 24s for women ",
    //     isonsale: true,
    //     isStrip: false),
  ];
}
