import 'package:flutter/material.dart';
import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
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
            children: [
              Text('Hi,',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: darkthem.darkTheme
                          ? Colors.white
                          : Theme.of(context).primaryColor)),
              Text(
                ' Belal Soliman',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color:
                        darkthem.darkTheme ? Colors.white : Colors.grey[600]),
              ),
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
