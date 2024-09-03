import 'package:flutter/material.dart';
import 'package:pharnacy_trust/models/product_model.dart';
import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:pharnacy_trust/widget/shop_view_widget/heart_widget.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
    required this.onPress,
  });

  final double width, aspectRetio;
  final ProductModel product;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    DarkThemeProvider darkThemeProvider =
        Provider.of<DarkThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      color: darkThemeProvider.darkTheme ? Colors.grey[300] : Colors.white,
      width: width,
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: darkThemeProvider.darkTheme
                      ? Colors.grey[300]
                      : const Color(0xFF979797).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(product.images),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              color:
                  darkThemeProvider.darkTheme ? Colors.grey[300] : Colors.white,
              child: Text(
                product.title,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFF7643),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: Container(
                      height: 24,
                      width: 24,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const HeartWidget()),
                ),
              ],
            ),
            Text("\$${product.discountPercentage}",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.lineThrough,
                      decorationThickness: 2,
                      decorationColor: Colors.red,
                    )),
          ],
        ),
      ),
    );
  }
}
