import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconly/iconly.dart';
import 'package:pharnacy_trust/consts/firebase_auth.dart';

import 'package:pharnacy_trust/consts/loading_manger.dart';
import 'package:pharnacy_trust/screens/Auth/auth_btn.dart';
import 'package:pharnacy_trust/screens/btn_nav_bar.dart';
import 'package:pharnacy_trust/service/global_methods.dart';

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
    _addressFoucNode.dispose();

    super.dispose();
  }

  bool isLoading = false;

  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      setState(() {
        isLoading = true;
      });

      try {
        await authinstance.createUserWithEmailAndPassword(
          email: _emailController.text.toLowerCase().trim(),
          password: _passwordController.text.toLowerCase().trim(),
        );
        final User? user = authinstance.currentUser;
        final uid = user!.uid;
        await FirebaseFirestore.instance.collection("users").doc(uid).set({
          "id": uid,
          "name": _userNameController.text,
          "email": _emailController.text,
          "address": _addressController.text,
          "userwishlist": [],
          "usercart": [],
          "userCreate": Timestamp.now(),
        });

        // If successful, show success dialog and navigate to BtnNavBar
        Fluttertoast.showToast(
            msg: "Account created successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
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
          isLoading = false; // Stop loading after showing the error dialog
        });
      } on Exception catch (e) {
        GlobalMethods.errorDialog(
          subtitle: e.toString(),
          // ignore: use_build_context_synchronously
          ctx: context,
          title: "Error signing up",
        );
        setState(() {
          isLoading = false; // Stop loading after showing the error dialog
        });
      } finally {
        // Ensure loading is stopped in case of success
        if (authinstance.currentUser != null) {
          setState(() {
            isLoading = false;
          });
        }
      }
    } else {
      // If form is not valid, stop loading immediately
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: LoadingManger(
        isLoading: isLoading,
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
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue),
                ),
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
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue),
                ),
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
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            TextFormField(
              controller: _addressController,
              focusNode: _addressFoucNode,
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
                labelText: "Shipping Address",
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue),
                ),
              ),
            ),
            const SizedBox(height: 20),
            AuthBtn(
              btnText: "Sign Up",
              fct: _submit,
              color: Colors.white38,
            ),
          ],
        ),
      ),
    );
  }
}
