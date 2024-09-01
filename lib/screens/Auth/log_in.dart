import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pharnacy_trust/screens/Auth/log_in_swiper.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordFoucNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _obscureText = true;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFoucNode.dispose();
    super.dispose();
  }

  // ignore: unused_element
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      print("form submitted");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const LogInSwiper(),
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.19),
                    const Text("Welcome Back ",
                        style: TextStyle(color: Colors.white, fontSize: 40)),
                    const Text("  Sign in to continue",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => FocusScope.of(context)
                                  .requestFocus(_passwordFoucNode),
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
                                    borderSide:
                                        BorderSide(color: Colors.lightBlue)),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              obscureText: _obscureText,
                              controller: _passwordController,
                              textInputAction: TextInputAction.done,
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
                              decoration: const InputDecoration(
                                labelText: "Password",
                                suffixIcon: Icon(Icons.visibility_off,
                                    color: Colors.white, size: 20),
                                labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                              ),
                            ),
                          ],
                        )),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
