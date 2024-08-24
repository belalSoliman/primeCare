import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDark, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor:
          isDark ? const Color(0xff00001a) : const Color(0xffffffff),
      primaryColor: const Color(0xff4157FF),
      colorScheme: ThemeData().colorScheme.copyWith(
          secondary: isDark ? const Color(0xff0a0d2c) : const Color(0xfff2fdfd),
          brightness: isDark ? Brightness.dark : Brightness.light),
      cardColor: isDark ? const Color(0xff0a0d2c) : const Color(0xfff2fdfd),
      canvasColor: isDark ? Colors.black : Colors.grey[50],
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDark
              ? const ColorScheme.dark()
              : const ColorScheme
                  .light()), // if we want to change color of button
    );
  }
}
