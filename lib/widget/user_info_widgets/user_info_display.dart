import 'package:flutter/material.dart';
import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:pharnacy_trust/screens/home_page.dart';
import 'package:provider/provider.dart';

class UserInfoDisplay extends StatefulWidget {
  const UserInfoDisplay({super.key});

  @override
  State<UserInfoDisplay> createState() => _UserInfoDisplayState();
}

class _UserInfoDisplayState extends State<UserInfoDisplay> {
  @override
  Widget build(BuildContext context) {
    final darkthem = Provider.of<DarkThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Hi, ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: darkthem.darkTheme
                            ? Colors.white
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: 'Belal Soliman',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: darkthem.darkTheme
                            ? Colors.white
                            : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              const HomeScreen(),
            ],
          ),
          Text(
            "Welcome to Prime Care your health partner",
            style: TextStyle(
                fontSize: 16,
                color: darkthem.darkTheme ? Colors.white : Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
