import 'package:flutter/material.dart';
import 'package:pharnacy_trust/models/product_model.dart';
import 'package:pharnacy_trust/screens/cart/product_details/product_details.dart';
import 'package:provider/provider.dart';

class OnSaleWidget extends StatelessWidget {
  const OnSaleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context);

    // Calculate the discounted price
    final discountedPrice =
        product.price - (product.price * (product.discountPercentage / 100));

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetails.routeName,
            arguments: product.id);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            // The image at the lowest level
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                product.images,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Semi-transparent black overlay
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            // Title at the top
            Positioned(
              top: 10,
              left: 10,
              right: 10,
              child: Text(
                product.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Discount percentage, original price, and discounted price
            Positioned(
              bottom: 10,
              left: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Discount percentage
                  Text(
                    '-${product.discountPercentage.toStringAsFixed(0)}%',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Original price (strikethrough)
                  Text(
                    '\$${product.price.toStringAsFixed(1)}',
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Discounted price
                  Text(
                    '\$${discountedPrice.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFFFF7643),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
