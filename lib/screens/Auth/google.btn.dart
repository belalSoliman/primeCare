import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:pharnacy_trust/screens/btn_nav_bar.dart';
import 'package:pharnacy_trust/service/global_methods.dart';

class Googlebtn extends StatefulWidget {
  const Googlebtn({super.key, required this.press, required this.icon});
  final VoidCallback press;
  final Widget icon;

  @override
  State<Googlebtn> createState() => _GooglebtnState();
}

class _GooglebtnState extends State<Googlebtn> {
  Future<void> googleLogin() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();

    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null || googleAuth.idToken != null) {
        try {
          await FirebaseAuth.instance.signInWithCredential(
            GoogleAuthProvider.credential(
              idToken: googleAuth.idToken,
              accessToken: googleAuth.accessToken,
            ),
          );
          if (mounted) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const BtnNavBar(),
            ));
          }
        } on FirebaseAuthException catch (e) {
          if (mounted) {
            GlobalMethods.errorDialog(
              subtitle: e.message.toString(),
              ctx: context,
              title: "Error signing up",
            );
          }
        }
      }
    }
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: googleLogin,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 56,
        width: 56,
        decoration: const BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: widget.icon,
      ),
    );
  }
}
