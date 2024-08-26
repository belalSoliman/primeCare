import 'package:flutter/material.dart';
import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:pharnacy_trust/widget/user_info_widgets/address_dialog_method.dart';

import 'package:pharnacy_trust/widget/user_info_widgets/user_info_display.dart';
import 'package:pharnacy_trust/widget/user_info_widgets/user_info_list_item.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  List<Map<String, dynamic>> _userDetails = [];

  @override
  void initState() {
    super.initState();
    _userDetails = [
      {
        'title': 'Address',
        'icona': const Icon(
          Icons.home_outlined,
          color: Colors.blue,
          size: 30,
        ),
        "onTap": (context) => showDialog(
              context: context,
              builder: (context) => AddressDialog(context: context),
            ),
      },
      {
        'title': 'Orders',
        'icona': const Icon(
          Icons.category_outlined,
          color: Colors.blue,
          size: 30,
        ),
      },
      {
        'title': 'Wishlist',
        'icona': const Icon(
          Icons.favorite_border,
          color: Colors.blue,
          size: 30,
        ),
      },
      {
        'title': 'viewed products',
        'icona': const Icon(
          Icons.visibility_outlined,
          color: Colors.blue,
          size: 30,
        ),
      },
      {
        'title': 'Forget password',
        'icona': const Icon(
          Icons.password_outlined,
          color: Colors.blue,
          size: 30,
        ),
      },
      {
        'title': 'Logout',
        'icona': const Icon(
          Icons.logout_outlined,
          color: Colors.blue,
          size: 30,
        ),
      },
    ];
  }

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
            itemCount: _userDetails.length,
            itemBuilder: (BuildContext context, int index) {
              return UserInfoListItem(
                title: _userDetails[index]['title'],
                icona: _userDetails[index]['icona'],
                onTap: () => _userDetails[index]['onTap'](context),
              );
            },
          ),
        )
      ],
    );
  }
}
