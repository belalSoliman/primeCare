import 'package:flutter/material.dart';
import 'package:pharnacy_trust/screens/home_page.dart';
import 'package:pharnacy_trust/widget/user_info_widgets/user_info_display.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        UserInfoDisplay(),
        Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        HomeScreen()
      ],
    );
  }
}
