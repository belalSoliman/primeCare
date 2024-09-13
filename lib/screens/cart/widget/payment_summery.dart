import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharnacy_trust/models/cart_model.dart';

import 'package:pharnacy_trust/provider/product_provider.dart';
import 'package:pharnacy_trust/service/global_methods.dart';
import 'package:uuid/uuid.dart';

class PaymentSummary extends StatelessWidget {
  final double totalAmount;
  final double totalDiscount;
  final List<CartModel> cartItems;
  final ProductProvider productProvider;

  const PaymentSummary({
    super.key,
    required this.totalAmount,
    required this.totalDiscount,
    required this.cartItems,
    required this.productProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Payment Summary',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          const SizedBox(height: 10),
          PaymentRow(
            label: 'Order Total',
            value: '\$${totalAmount.toStringAsFixed(2)}',
          ),
          PaymentRow(
            label: 'Items Discount',
            value: '- \$${totalDiscount.toStringAsFixed(2)}',
          ),
          const PaymentRow(label: 'Shipping', value: 'Free'),
          const Divider(),
          PaymentRow(
            label: 'Total',
            value: '\$${(totalAmount - totalDiscount).toStringAsFixed(2)}',
            isTotal: true,
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                final orderId = Uuid().v4(); // Generate a unique order ID
                List<Map<String, dynamic>> products = [];

                // Iterate through the cart items to add them to the products list
                cartItems.forEach((cartItem) {
                  final product =
                      productProvider.findProductById(cartItem.productid);
                  products.add({
                    "productId": cartItem.productid,
                    "quantity": cartItem.quantity,
                    "price": product.price, // Get the product price
                    "image": product.images, // Get the product image
                  });
                });

                try {
                  await FirebaseFirestore.instance
                      .collection("orders")
                      .doc(orderId)
                      .set({
                    "id": orderId,
                    "userId": FirebaseAuth.instance.currentUser!.uid,
                    "total": (totalAmount - totalDiscount).toStringAsFixed(2),
                    "createdAt": Timestamp.now(),
                    "products": products, // Include the list of products
                  });

                  // Clear the cart after the order is successfully placed
                  // You'll need to call the clearCart() method from the CartProvider
                } catch (e) {
                  GlobalMethods.errorDialog(
                    subtitle: e.toString(),
                    ctx: context,
                    title: 'Error',
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                backgroundColor: Colors.lightBlue, // Customize button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text(
                'Place Order',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const PaymentRow({
    super.key,
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.indigo : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
