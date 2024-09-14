import 'package:flutter/material.dart';

class OrderConfirmationPage extends StatelessWidget {
  final String orderId;
  final double totalAmount;
  final String paymentMethod;

  const OrderConfirmationPage({
    Key? key,
    required this.orderId,
    required this.totalAmount,
    required this.paymentMethod,
  }) : super(key: key);

  static const String routeName = '/order-confirmation';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Confirmation'),
        backgroundColor: Colors.lightBlue,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(screenWidth * 0.04),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue.shade400, Colors.lightBlue.shade700],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.05),
              Icon(
                Icons.check_circle_outline,
                color: Colors.white,
                size: screenWidth * 0.2,
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                'Thank You for Your Purchase!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                margin: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Details',
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue.shade700,
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      'Order ID: $orderId',
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      'Total Amount: EGP ${totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      'Payment Method: $paymentMethod',
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                'We hope to see you again soon!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.shopping_bag),
                label: Text('Continue Shopping'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.lightBlue.shade700,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.2,
                    vertical: screenHeight * 0.02,
                  ),
                  textStyle: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.08),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
