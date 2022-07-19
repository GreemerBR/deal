import 'package:flutter/material.dart';

import '../login/widgets/default_button.dart';
import '../login/widgets/default_input.dart';
import '../login/widgets/default_title.dart';
import '../main_menu/main_menu_page.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(242, 242, 242, 242),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: DefaultTitle(
                  title: 'Não possui uma conta?',
                  subtitle: 'Comece a emprestar agora mesmo!',
                  colortitle: Color.fromARGB(255, 99, 66, 191),
                  colorSubtitle: Color.fromARGB(255, 99, 66, 191),
                ),
              ),
              SizedBox(height: 50),
              DefaultInput(
                texto: 'Nome Completo',
                textColor: Color.fromARGB(255, 99, 66, 191),
                backgroundColor: Colors.white,
              ),
              DefaultInput(
                texto: 'Email',
                textColor: Color.fromARGB(255, 99, 66, 191),
                backgroundColor: Colors.white,
              ),
              DefaultInput(
                texto: 'Usuário de Login',
                textColor: Color.fromARGB(255, 99, 66, 191),
                backgroundColor: Colors.white,
              ),
              DefaultInput(
                texto: 'Senha',
                icon: Icon(
                  Icons.remove_red_eye,
                  color: Color.fromARGB(255, 99, 66, 191),
                ),
                textColor: Color.fromARGB(255, 99, 66, 191),
                backgroundColor: Colors.white,
              ),
              DefaultButton(
                  buttonText: 'Criar Conta',
                  borderSize: 0,
                  rota: MainMenuPage(),
                  func: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
