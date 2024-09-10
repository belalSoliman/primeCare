import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharnacy_trust/consts/firebase_auth.dart';
import 'package:pharnacy_trust/screens/Auth/auth_btn.dart';
import 'package:pharnacy_trust/screens/Auth/forget_password.dart';
import 'package:pharnacy_trust/screens/btn_nav_bar.dart';
import 'package:pharnacy_trust/service/global_methods.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordFoucNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  IconData _iconShow = Icons.visibility;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFoucNode.dispose();
    super.dispose();
  }

  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      setState(() {});

      try {
        await authinstance.signInWithEmailAndPassword(
          email: _emailController.text.toLowerCase().trim(),
          password: _passwordController.text.toLowerCase().trim(),
        );

        // If successful, show success dialog and navigate to BtnNavBar

        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) {
            return const BtnNavBar();
          }),
        );
      } on FirebaseAuthException catch (e) {
        GlobalMethods.errorDialog(
          subtitle: e.message.toString(),
          // ignore: use_build_context_synchronously
          ctx: context,
          title: "Error signing up",
        );
        setState(() {
          // Stop loading after showing the error dialog
        });
      } on Exception catch (e) {
        GlobalMethods.errorDialog(
          subtitle: e.toString(),
          // ignore: use_build_context_synchronously
          ctx: context,
          title: "Error signing up",
        );
        setState(() {
          // Stop loading after showing the error dialog
        });
      } finally {
        // Ensure loading is stopped in case of success
        if (authinstance.currentUser != null) {
          setState(() {});
        }
      }
    } else {
      // If form is not valid, stop loading immediately
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethods = GlobalMethods();
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              textInputAction: TextInputAction.next,
              onEditingComplete: () =>
                  FocusScope.of(context).requestFocus(_passwordFoucNode),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty || !value.contains("@")) {
                  return "Please enter a valid email address";
                } else {
                  return null;
                }
              },
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue)),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              onEditingComplete: () {
                _submit();
              },
              obscureText: _obscureText,
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              focusNode: _passwordFoucNode,
              validator: (value) {
                if (value!.isEmpty || value.length < 6) {
                  return "Please enter your password";
                } else {
                  return null;
                }
              },
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Password",
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                      _iconShow = _obscureText
                          ? Icons.visibility
                          : Icons.visibility_off;
                    });
                  },
                  child: Icon(_iconShow, color: Colors.white, size: 20),
                ),
                labelStyle: const TextStyle(color: Colors.white),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: () {
                    globalMethods.navigateTo(
                      ctx: context,
                      routeName: ForgetPassword.routeName,
                    );
                  },
                  child: const Text(
                    "Forgot Password?",
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  )),
            ),
            const SizedBox(height: 20),
            AuthBtn(
              btnText: "Sign In",
              fct: () {
                _submit();
              },
              color: Colors.white38,
            ),
          ],
        ));
  }
}
