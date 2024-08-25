import 'package:flutter/material.dart';
import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:pharnacy_trust/screens/home_page.dart';
import 'package:pharnacy_trust/widget/user_info_widgets/user_info_display.dart';
import 'package:pharnacy_trust/widget/user_info_widgets/user_info_list_item.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final List<Map<String, dynamic>> _userDetails = [
    {
      'title': 'Address',
      'subtitle': 'Your address',
      'icona': const Icon(
        Icons.home_outlined,
        color: Colors.blue,
        size: 30,
      ),
    },
    {
      'title': 'Orders',
      'subtitle': 'Home Page',
      'icona': const Icon(
        Icons.home_outlined,
        color: Colors.blue,
        size: 30,
      ),
    },
    {
      'title': 'Home',
      'subtitle': 'Home Page',
      'icona': const Icon(
        Icons.home_outlined,
        color: Colors.blue,
        size: 30,
      ),
    }
  ];
  @override
  Widget build(BuildContext context) {
    final darkthem = Provider.of<DarkThemeProvider>(context);
    return Column(
      children: [
        const UserInfoDisplay(),
        Divider(
          thickness: 1,
          color: darkthem.darkTheme ? Colors.white : Colors.grey,
        ),
        const HomeScreen(),
        Expanded(
          child: ListView.builder(
            itemCount: _userDetails.length,
            itemBuilder: (BuildContext context, int index) {
              return UserInfoListItem(
                title: _userDetails[index]['title'],
                subtitle: _userDetails[index]['subtitle'],
                icona: _userDetails[index]['icona'],
              );
            },
          ),
        )
      ],
    );
  }
}
