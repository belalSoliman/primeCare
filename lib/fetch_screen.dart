import 'package:flutter/material.dart';
import 'package:pharnacy_trust/consts/consts.dart';
import 'package:pharnacy_trust/provider/product_provider.dart';
import 'package:pharnacy_trust/screens/btn_nav_bar.dart';
import 'package:provider/provider.dart';

class FetchScreen extends StatefulWidget {
  const FetchScreen({super.key});

  @override
  State<FetchScreen> createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(microseconds: 100), () async {
      final productProvider =
          // ignore: use_build_context_synchronously
          Provider.of<ProductProvider>(context, listen: false);

      await productProvider.fetchProducts();
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const BtnNavBar();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white, // Set the background color
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(Constss.loginImages[2]),
              fit: BoxFit.cover,
            )),
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
        ]));
  }
}
