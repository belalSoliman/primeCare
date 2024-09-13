import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pharnacy_trust/inner_screens/orders_screen/oder_item.dart';
import 'package:pharnacy_trust/inner_screens/orders_screen/empty_order_screen.dart';

class OrderScreenView extends StatelessWidget {
  const OrderScreenView({super.key});
  static const routeName = '/OrderScreenView';

  Future<List<Map<String, dynamic>>> fetchOrders() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('orders')
        .where('userId', isEqualTo: userId)
        .get();

    return querySnapshot.docs.map((doc) {
      return {
        'id': doc.id, // Fetch the orderId (which is the document ID)
        ...doc.data()
            as Map<String, dynamic>, // Fetch the rest of the order data
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching orders'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const EmptyOrderScreen();
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final orderData = snapshot.data![index];
                return OrderItem(orderData: orderData);
              },
            );
          }
        },
      ),
    );
  }
}
