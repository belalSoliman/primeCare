import 'package:flutter/material.dart';
import 'package:pharnacy_trust/consts/theme_Data.dart';
import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    final darkthem = Provider.of<DarkThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Styles.themeData(false, context).primaryColor.withOpacity(0.02),
      ),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center the content vertically
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/category assets/sushi (1).png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Sushi",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: darkthem.darkTheme ? Colors.white : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
