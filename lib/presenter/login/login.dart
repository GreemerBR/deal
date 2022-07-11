import 'package:flutter/material.dart';

import 'widgets/background_image.dart';
import 'widgets/default_button.dart';
import 'widgets/default_input.dart';
import 'widgets/default_link_text.dart';
import 'widgets/default_title.dart';
import 'widgets/people_image.dart';

class Login extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                BackgroundImage(),
                PeopleImage(),
              ],
            ),
                DefaultTitle(),
                DefaultInput(texto: 'Login'),
                DefaultInput(icon: Icon(Icons.remove_red_eye), texto: 'Senha'),
                DefaultButton(),
                DefaultLinkText(),
          ],
        ),
      ),
    );
  }
}
