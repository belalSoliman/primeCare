import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  static const routeName = '/order-details';

  final String orderId;

  const OrderDetailsScreen({super.key, required this.orderId});

  Future<Map<String, dynamic>> fetchOrderDetails(String orderId) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('orders')
        .doc(orderId)
        .get();

    return doc.data() as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchOrderDetails(orderId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching order details'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Order not found'));
          } else {
            final orderData = snapshot.data!;
            final products = orderData['products'] as List<dynamic>;
            final totalAmount = orderData['total'];
            final orderDate = (orderData['createdAt'] as Timestamp).toDate();

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order ID: $orderId',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Order Date: ${orderDate.day}/${orderDate.month}/${orderDate.year}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  const Text(
                    'Products:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ListTile(
                          leading: Image.network(
                            product['image'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            product[
                                'productId'], // You may replace this with a product name if available
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Quantity: ${product['quantity']}',
                          ),
                          trailing: Text(
                            '\$${product['price']}',
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  Text(
                    'Total: \$$totalAmount',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
