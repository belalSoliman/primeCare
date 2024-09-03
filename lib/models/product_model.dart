class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final String images;
  final bool isFavorite;
  final bool isonsale;
  final bool isStrip;

  ProductModel(
      {required this.id,
      required this.title,
      required this.images,
      required this.category,
      required this.price,
      required this.discountPercentage,
      required this.description,
      required this.isFavorite,
      required this.isonsale,
      required this.isStrip});
}
