import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharnacy_trust/consts/firebase_auth.dart';
import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:pharnacy_trust/widget/dark_theme_switch.dart';
import 'package:provider/provider.dart';

class UserInfoDisplay extends StatefulWidget {
  const UserInfoDisplay({super.key});

  @override
  State<UserInfoDisplay> createState() => _UserInfoDisplayState();
}

class _UserInfoDisplayState extends State<UserInfoDisplay> {
  String? name;
  String? email;
  final User? currentUser = authinstance.currentUser;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    if (currentUser != null) {
      try {
        String uid = currentUser!.uid;
        final DocumentSnapshot doc =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();

        setState(() {
          name = doc.get('name');
          email = doc.get('email');
        });
      } on FirebaseException catch (e) {
        print('Error fetching user data: $e');
      }
    } else {
      print('No user is signed in.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final darkthem = Provider.of<DarkThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Hi, ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: darkthem.darkTheme
                            ? Colors.white
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: name ?? 'user',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: darkthem.darkTheme
                            ? Colors.white
                            : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              const HomeScreen(),
            ],
          ),
          Text(
            "Welcome to Prime Care your health partner",
            style: TextStyle(
                fontSize: 16,
                color: darkthem.darkTheme ? Colors.white : Colors.grey[600]),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            email ?? '',
            style: TextStyle(
                fontSize: 16,
                color: darkthem.darkTheme ? Colors.white : Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
