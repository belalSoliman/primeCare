import 'package:flutter/material.dart';
import 'package:pharnacy_trust/consts/consts.dart';

import 'package:pharnacy_trust/provider/dark_theme_provider.dart';

import 'package:pharnacy_trust/widget/user_info_widgets/user_info_display.dart';
import 'package:pharnacy_trust/widget/user_info_widgets/user_info_list_item.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
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
        Expanded(
            child: ListView.builder(
          itemCount: Constss.userDetails.length,
          itemBuilder: (BuildContext context, int index) {
            return UserInfoListItem(
              title: Constss.userDetails[index]['title'],
              icona: Constss.userDetails[index]['icona'],
              onTap: Constss.userDetails[index]
                  ['onTap'], // Handle the null case here
            );
          },
        ))
      ],
    );
  }
}
