import 'package:flutter/material.dart';

import '../main_menu/main_menu_page.dart';
import 'widgets/login_google.dart';
import 'widgets/circle_avatar.dart';
import 'widgets/default_button.dart';
import 'widgets/default_input.dart';
import 'widgets/default_link_text.dart';
import 'widgets/default_title.dart';

class LoginPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 66, 191),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 55),
            DefaultTitle(
              title: 'Já possui conta?',
              subtitle: 'Entre agora mesmo',
              colortitle: Colors.white,
              colorSubtitle: Colors.white,
            ),
            ProfileAvatar(),
            DefaultInput(texto: 'Login'),
            DefaultInput(icon: Icon(Icons.remove_red_eye), texto: 'Senha'),
            GoogleButton(),
            DefaultButton(rota: MainMenuPage(), buttonText: 'ACESSAR'),
            DefaultLinkText(),
          ],
        ),
      ),
    );
  }
}
