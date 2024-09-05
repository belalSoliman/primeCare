import 'package:flutter/foundation.dart';

class WishListModel with ChangeNotifier {
  final String id;

  final String productid;

  WishListModel({
    required this.id,
    required this.productid,
  });
}
