import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Ordermodel with ChangeNotifier {
  final String orderId, userId, prodcutId, username, price, image, quantity;
  final Timestamp orderdate;

  Ordermodel(
      {required this.orderId,
      required this.userId,
      required this.prodcutId,
      required this.username,
      required this.price,
      required this.image,
      required this.quantity,
      required this.orderdate});
}
