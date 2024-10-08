import 'package:flutter/material.dart';
import 'package:pharnacy_trust/models/viewd_product_model.dart';
import 'package:pharnacy_trust/provider/product_provider.dart';
import 'package:pharnacy_trust/screens/cart/product_details/product_details.dart';

import 'package:provider/provider.dart';

class ViewdItem extends StatelessWidget {
  const ViewdItem({super.key});

  @override
  Widget build(BuildContext context) {
    final viewdItem = Provider.of<ViewdProductModel>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final product = productProvider.findProductById(viewdItem.productid);

    final hasDiscount = product.isonsale && product.discountPercentage > 0;
    final discountedPrice =
        product.price - (product.price * product.discountPercentage / 100);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetails.routeName,
            arguments: product.id);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xff4157FF).withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.network(
                product.images,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    hasDiscount
                        ? 'Discounted Price: \$${discountedPrice.toStringAsFixed(2)}'
                        : 'Price: \$${product.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: hasDiscount ? Colors.red : Colors.black,
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
