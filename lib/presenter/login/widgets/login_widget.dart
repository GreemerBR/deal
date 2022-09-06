import '../../../core/general_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../main.dart';
import 'default_button.dart';
import 'default_input.dart';
import 'default_link_text.dart';

class LoginWidget extends StatefulHookConsumerWidget {
  const LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends ConsumerState<LoginWidget> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future signIn() async {
    var userSNP = await ref.read(userStateNotifierProvider.notifier);
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
     userSNP.getUser();

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
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
        DefaultInput(
          icon: Icon(Icons.remove_red_eye),
          texto: 'Senha',
          controller: passwordController,
          password: true,
        ),
        DefaultLinkText(),
          ],
        ),
        SizedBox(height: 20),
        DefaultButton(buttonText: 'Entrar', func: signIn),
      ],
    );
  }
}
