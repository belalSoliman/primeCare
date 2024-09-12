import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final String images;
  final bool isonsale;
  final bool isStrip;

  ProductModel({
    required this.id,
    required this.title,
    required this.images,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.description,
    required this.isonsale,
    required this.isStrip,
  });

  // Factory constructor to create ProductModel from Firestore document
  factory ProductModel.fromDocument(Map<String, dynamic> doc) {
    return ProductModel(
      id: doc['productId'] as String,
      title: doc['title'] as String,
      images: doc['images'] as String,
      category: doc['category'] as String,
      price: (doc['price'] as num).toDouble(),
      discountPercentage: (doc['discountPercentage'] as num).toDouble(),
      description: doc['description'] as String,
      isonsale: doc['isOnSale'] as bool,
      isStrip: doc['isStrip'] as bool,
    );
  }
}
