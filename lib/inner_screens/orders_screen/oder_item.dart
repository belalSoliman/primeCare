import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharnacy_trust/inner_screens/orders_screen/order_details_screen.dart';
import 'package:pharnacy_trust/service/global_methods.dart';

class OrderItem extends StatelessWidget {
  final Map<String, dynamic> orderData;

  const OrderItem({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethods = GlobalMethods();
    final orderId = orderData['id']; // The orderId fetched from Firestore
    final productPrice = orderData['products'][0]['price'];
    final productImage = orderData['products'][0]['image'];
    final orderDate = (orderData['createdAt'] as Timestamp).toDate();

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          OrderDetailsScreen.routeName,
          arguments: orderId, // Pass the orderId to the OrderDetailsScreen
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.grey[200]!, width: 0.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width * 0.25,
              child: Image.network(
                productImage,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    orderId, // Display the order ID
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text("Paid: ",
                          style: TextStyle(color: Colors.black)),
                      Text(
                        "\$$productPrice",
                        style:
                            const TextStyle(color: Colors.green, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              "${orderDate.day}/${orderDate.month}/${orderDate.year}",
              style: const TextStyle(color: Colors.black, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
