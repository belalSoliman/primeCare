import 'package:flutter/material.dart';
import 'package:pharnacy_trust/models/cart_model.dart';
import 'package:pharnacy_trust/provider/product_provider.dart';
import 'package:pharnacy_trust/screens/cart/widget/payment_summery.dart';

class PaymentBtn extends StatelessWidget {
  final double totalAmount;
  final double totalDiscount;
  final List<CartModel> cartItems;
  final ProductProvider productProvider;

  const PaymentBtn({
    super.key,
    required this.totalAmount,
    required this.totalDiscount,
    required this.cartItems,
    required this.productProvider,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double horizontalPadding = screenWidth * 0.1;
    const double verticalPadding = 15.0;
    final double fontSize = screenWidth * 0.045;
    final double borderRadius = screenWidth * 0.05;

    return Center(
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            builder: (context) => Wrap(
              children: [
                PaymentSummary(
                  totalAmount: totalAmount,
                  totalDiscount: totalDiscount,
                  cartItems: cartItems, // Pass cart items to PaymentSummary
                  productProvider:
                      productProvider, // Pass product provider to PaymentSummary
                ),
              ],
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(screenWidth * 0.8, 48),
          backgroundColor: Colors.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding),
        ),
        child: Text(
          'Pay Now',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
