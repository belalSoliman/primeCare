import 'package:flutter/material.dart';
import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class UserInfoListItem extends StatefulWidget {
  const UserInfoListItem(
      {super.key, required this.icona, required this.title, this.onTap});
  final Icon icona;
  final String title;

  final void Function()? onTap;

  @override
  State<UserInfoListItem> createState() => _UserInfoListItemState();
}

class _UserInfoListItemState extends State<UserInfoListItem> {
  @override
  Widget build(BuildContext context) {
    final darkthem = Provider.of<DarkThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: GestureDetector(
        onTap: () {},
        child: ListTile(
          leading: widget.icona,
          title: Text(
            widget.title,
            style: TextStyle(
                color: darkthem.darkTheme ? Colors.white : Colors.grey[600],
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          trailing: const Icon(
            Icons.chevron_right,
          ),
        ),
      ),
    );
  }
}
