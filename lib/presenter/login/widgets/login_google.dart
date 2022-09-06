import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      buttonType: ButtonType.google,
      btnText: 'Cadastrar com Google',
      onPressed: () {
       
      },
    );
  }
}
