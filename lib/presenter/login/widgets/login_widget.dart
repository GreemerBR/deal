import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import 'default_button.dart';
import 'default_input.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    navigatorKey.currentState!.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultInput(
          texto: 'Login',
          controller: emailController,
        ),
        DefaultInput(
          icon: Icon(Icons.remove_red_eye),
          texto: 'Senha',
          controller: passwordController,
          password: true,
        ),
        DefaultButton(buttonText: 'ACESSAR', func: signIn),
      ],
    );
  }
}
