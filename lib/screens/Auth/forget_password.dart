import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pharnacy_trust/consts/firebase_auth.dart';
import 'package:pharnacy_trust/screens/Auth/auth_btn.dart';
import 'package:pharnacy_trust/screens/Auth/log_in_swiper.dart';
import 'package:pharnacy_trust/service/global_methods.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  static const routeName = '/ForgetPassword';

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submit() async {
    try {
      await authinstance.sendPasswordResetEmail(
          email: _emailController.text.toLowerCase());
      Fluttertoast.showToast(
          msg: "An email has been sent to your email address",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } on FirebaseAuthException catch (e) {
      GlobalMethods.errorDialog(
          subtitle: e.message.toString(), ctx: context, title: "Error");
    } catch (e) {
      GlobalMethods.errorDialog(
          subtitle: e.toString(), ctx: context, title: "Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const LogInSwiper(),
        Container(
          color: Colors.black.withOpacity(0.7),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.white)),
              ),
              const Text(
                "Forget Password",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              Form(
                  child: TextFormField(
                controller: _emailController,
                onEditingComplete: () => FocusScope.of(context).unfocus(),
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  icon: Icon(Icons.email, color: Colors.white, size: 30),
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue)),
                  errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty ||
                      !value.contains('@') ||
                      !value.contains('.com')) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              )),
              const SizedBox(
                height: 20,
              ),
              AuthBtn(
                btnText: 'Reset Password',
                fct: () {
                  _submit();
                },
                color: Colors.lightBlue,
              )
            ],
          ),
        )
      ]),
    );
  }
}
