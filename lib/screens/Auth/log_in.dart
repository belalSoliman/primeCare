import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharnacy_trust/consts/consts.dart';
import 'package:pharnacy_trust/screens/Auth/auth_btn.dart';
import 'package:pharnacy_trust/screens/Auth/divider.dart';

import 'package:pharnacy_trust/screens/Auth/google.btn.dart';

import 'package:pharnacy_trust/screens/Auth/log_in_swiper.dart';
import 'package:pharnacy_trust/screens/Auth/login_form.dart';
import 'package:pharnacy_trust/screens/Auth/sign_up.dart';
import 'package:pharnacy_trust/service/global_methods.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});
  static const routeName = '/LogIn';
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // ignore: unused_element
  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethods = GlobalMethods();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(Constss.loginImages[0]),
              fit: BoxFit.cover,
            )),
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    const Text("Welcome Back ",
                        style: TextStyle(color: Colors.white, fontSize: 40)),
                    const Text("Sign in to continue",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    const LoginForm(),
                    const SizedBox(height: 15),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Googlebtn(
                          icon: SvgPicture.string(Constss.googleIcon),
                          press: () {},
                        ),
                        const SizedBox(width: 20),
                        Googlebtn(
                          icon: SvgPicture.string(Constss.facebookIcon),
                          press: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Dividerb(),
                    const SizedBox(height: 8),
                    const SizedBox(height: 8),
                    RichText(
                        text: TextSpan(
                      text: "Don't have an account?",
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      children: [
                        TextSpan(
                          text: " Sign Up",
                          style: const TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              globalMethods.navigateTo(
                                  ctx: context, routeName: SignUp.routeName);
                            },
                        )
                      ],
                    ))
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
