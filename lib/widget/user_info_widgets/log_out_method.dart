import 'package:flutter/material.dart';
import 'package:pharnacy_trust/consts/firebase_auth.dart';
import 'package:pharnacy_trust/screens/Auth/log_in.dart';

class LogOutMethod extends StatelessWidget {
  final BuildContext context;
  const LogOutMethod({
    super.key,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      title: const Text('Log Out'),
      content: const Text('Are you sure you want to log out?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
                color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        TextButton(
          onPressed: () {
            authinstance.signOut();
            Navigator.of(context).pushReplacementNamed(LogIn.routeName);
          },
          child: const Text(
            'Log Out',
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
