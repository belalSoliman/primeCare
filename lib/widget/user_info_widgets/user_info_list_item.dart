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
  bool _isPressed = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
      if (widget.onTap != null) {
        widget.onTap!();
      } else {
        return null;
      }
    });
  }

  void _handleTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<DarkThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        child: Container(
          color: _isPressed
              ? (darkTheme.darkTheme
                  ? Colors.grey[850]
                  : Colors.lightBlue.shade50)
              : (darkTheme.darkTheme ? Colors.black : Colors.white),
          child: ListTile(
            leading: widget.icona,
            title: Text(
              widget.title,
              style: TextStyle(
                color: darkTheme.darkTheme ? Colors.white : Colors.grey[600],
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            trailing: const Icon(
              Icons.chevron_right,
            ),
          ),
        ),
      ),
    );
  }
}
