import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
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
        ),
        DefaultButton(buttonText: 'ACESSAR', func: signIn),
      ],
    );
  }
}
