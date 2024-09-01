import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordFoucNode = FocusNode();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFoucNode.dispose();
    super.dispose();
  }

  // ignore: unused_element
  void _submit() {}

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [],
      ),
    );
  }
}
