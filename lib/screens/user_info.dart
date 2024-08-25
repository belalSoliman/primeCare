import 'package:flutter/material.dart';
import 'package:pharnacy_trust/screens/home_page.dart';
import 'package:pharnacy_trust/widget/user_info_widgets/user_info_display.dart';
import 'package:pharnacy_trust/widget/user_info_widgets/user_info_list_item.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final List<Map<String, dynamic>> _userDetails = [
    {
      'title': 'Home',
      'subtitle': 'Home Page',
      'icona': const Icon(
        Icons.home_outlined,
        color: Colors.blue,
        size: 30,
      ),
      'onTap': () {
        print('Home');
      },
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserInfoDisplay(),
        HomeScreen(),
        UserInfoListItem(
          onTap: () => print('Home'),
          icona: const Icon(
            Icons.home_outlined,
            color: Colors.blue,
            size: 30,
          ),
          title: 'Home',
          subtitle: 'Home Page',
        ),
      ],
    );
  }
}
