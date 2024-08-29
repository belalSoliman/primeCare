import 'package:flutter/material.dart';
import 'package:pharnacy_trust/screens/cart/widget/counter_widget_cart.dart';

class CartWidgets extends StatefulWidget {
  const CartWidgets({super.key});

  @override
  State<CartWidgets> createState() => _CartWidgetsState();
}

class _CartWidgetsState extends State<CartWidgets> {
  int count = 1;
  int price = 100;
  // Start with 1 as default

  void incrementCounter() {
    setState(() {
      count++;
    });
  }

  void decrementCounter() {
    setState(() {
      if (count > 1) {
        // Ensure count doesn't go below 1
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage("assets/category_assets/cat-2.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sugar free gold",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "bottle of 500 pellets",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "\$${price * count}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.purple.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8, top: 8),
                child: GestureDetector(
                  onTap: () {
                    // Add action to remove item
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 18,
                  ),
                ),
              ),
              const Spacer(),
              CounterWidgetCart(
                count: count,
                onIncrement: incrementCounter,
                onDecrement: decrementCounter,
              ),
              const SizedBox(
                height: 5,
              )
            ],
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
