import 'package:flutter/material.dart';

import 'widgets/background_image.dart';
import 'widgets/circle_avatar.dart';
import 'widgets/default_button.dart';
import 'widgets/default_input.dart';
import 'widgets/default_link_text.dart';
import 'widgets/default_title.dart';
import 'widgets/people_image.dart';

class LoginPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 66, 191),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultTitle(),
          ProfileAvatar(),
          DefaultInput(texto: 'Login'),
          DefaultInput(icon: Icon(Icons.remove_red_eye), texto: 'Senha'),
          DefaultButton(),
          DefaultLinkText(),
        ],
      ),
    );
  }
}
