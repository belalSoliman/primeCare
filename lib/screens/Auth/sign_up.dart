import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:pharnacy_trust/screens/Auth/auth_btn.dart';

import 'package:pharnacy_trust/screens/Auth/log_in_swiper.dart';
import 'package:pharnacy_trust/screens/Auth/sign_up_form.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  static const routeName = '/signUp';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const LogInSwiper(),
        Container(
          color: Colors.black.withOpacity(0.7),
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  const Text("Welcome ",
                      style: TextStyle(color: Colors.white, fontSize: 40)),
                  const Text("Sign up to continue",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  const SignUpForm(),
                  const SizedBox(height: 20),
                  AuthBtn(
                    btnText: "Sign Up",
                    fct: () {},
                    color: Colors.white38,
                  ),
                  const SizedBox(height: 20),
                  RichText(
                      text: TextSpan(
                    text: "Already have an account?",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    children: [
                      TextSpan(
                        text: " Sign in",
                        style: const TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pop();
                          },
                      )
                    ],
                  ))
                ]),
          ),
        )
      ]),
    );
  }
}
