import 'package:flutter/material.dart';
import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class UserInfoListItem extends StatelessWidget {
  const UserInfoListItem(
      {super.key,
      required this.icona,
      required this.title,
      required this.subtitle});
  final Icon icona;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final darkthem = Provider.of<DarkThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffF5F7FF),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffA3B4FF),
              offset: Offset(0, 1),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: ListTile(
          leading: icona,
          title: Text(
            title,
            style: TextStyle(
                color: darkthem.darkTheme ? Colors.grey[800] : Colors.grey[600],
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          subtitle: Text(subtitle,
              style: TextStyle(
                  color:
                      darkthem.darkTheme ? Colors.grey[800] : Colors.grey[600],
                  fontWeight: FontWeight.w600,
                  fontSize: 14)),
          trailing: Icon(
            Icons.chevron_right,
          ),
        ),
      ),
    );
  }
}
