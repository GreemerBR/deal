import 'package:flutter/material.dart';

import 'widgets/background_image_login.dart';
import 'widgets/buttons_login.dart';
import 'widgets/texts_login.dart';

class LoginPage extends StatelessWidget {
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
            // DefaultInput(texto: 'Login'),
            // DefaultInput(icon: Icon(Icons.remove_red_eye), texto: 'Senha'),
            DefaultButton(),
            DefaultLinkText(),
          ],
        ),
      ),
    );
  }
}
