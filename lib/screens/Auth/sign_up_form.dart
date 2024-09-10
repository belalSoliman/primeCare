import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pharnacy_trust/consts/firebase_auth.dart';
import 'package:pharnacy_trust/screens/Auth/auth_btn.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _emailController = TextEditingController();
  final _emailFoucNode = FocusNode();
  final _passwordController = TextEditingController();
  final _passwordFoucNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _addressFoucNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
    _addressController.dispose();
    _passwordFoucNode.dispose();
    _emailFoucNode.dispose();

    super.dispose();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();

      try {
        await authinstance.createUserWithEmailAndPassword(
            email: _emailController.text.toLowerCase().trim(),
            password: _passwordController.text.toLowerCase().trim());
        print("done");
      } catch (e) {
        print(e);
        setState(() {
          isLoading = false;
        });
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _userNameController,
              textInputAction: TextInputAction.next,
              onEditingComplete: () =>
                  FocusScope.of(context).requestFocus(_emailFoucNode),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your name";
                } else {
                  return null;
                }
              },
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Full Name",
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue)),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              focusNode: _emailFoucNode,
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
                FocusScope.of(context).requestFocus(_addressFoucNode);
              },
              controller: _passwordController,
              textInputAction: TextInputAction.next,
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
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
            TextFormField(
              controller: _addressController,
              focusNode: _addressFoucNode,
              onEditingComplete: _submit,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.streetAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your address";
                } else {
                  return null;
                }
              },
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                suffixIcon: Icon(IconlyBold.location, color: Colors.white),
                labelText: " shipping Address",
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue)),
              ),
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator()
                : AuthBtn(
                    btnText: "Sign Up",
                    fct: () {
                      _submit();
                    },
                    color: Colors.white38,
                  ),
          ],
        ));
  }
}
