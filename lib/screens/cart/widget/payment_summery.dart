import 'package:flutter/material.dart';

class PaymentSummary extends StatelessWidget {
  final double totalAmount;
  final double totalDiscount; // Add this property

  const PaymentSummary({
    super.key,
    required this.totalAmount,
    required this.totalDiscount,
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
          const PaymentRow(
            label: 'Coupon Discount',
            value:
                '- 15.80', // This can be updated based on actual coupon logic
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
              onPressed: () {
                // Add action to proceed to payment
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
                    color: Colors.white),
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
