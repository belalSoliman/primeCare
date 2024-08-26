import 'package:flutter/material.dart';
import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:pharnacy_trust/widget/category_page_widgets/category_item.dart';
import 'package:provider/provider.dart';

class CategoryBodyView extends StatelessWidget {
  const CategoryBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    final darkthem = Provider.of<DarkThemeProvider>(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: darkthem.darkTheme
                  ? Color(0xff00001a)
                  : Theme.of(context).primaryColor.withOpacity(0.08),
              boxShadow: [
                BoxShadow(
                  color: darkthem.darkTheme
                      ? Color.fromARGB(255, 0, 0, 45)
                      : Colors.grey[200]!,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ]),
          child: const CategoryItem(),
        );
      },
    );
  }
}
