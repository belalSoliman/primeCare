import 'package:flutter/material.dart';

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

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {

    }
  }

  @override
  Widget build(BuildContext context) {
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
          ],
        ));
  }
}
