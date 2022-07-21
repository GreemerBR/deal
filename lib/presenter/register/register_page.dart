import 'package:app_2/core/database.dart';
import 'package:flutter/material.dart';

import '../is_logged/is_logged_page.dart';
import '../login/widgets/default_button.dart';
import '../login/widgets/default_input.dart';
import '../login/widgets/default_title.dart';
import '../main_menu/main_menu_page.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final database = DatabaseApp();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                controller: nameController,
              ),
              DefaultInput(
                texto: 'Email',
                textColor: Color.fromARGB(255, 99, 66, 191),
                backgroundColor: Colors.white,
                controller: emailController,
              ),
              DefaultInput(
                texto: 'Senha',
                icon: Icon(
                  Icons.remove_red_eye,
                  color: Color.fromARGB(255, 99, 66, 191),
                ),
                password: true,
                textColor: Color.fromARGB(255, 99, 66, 191),
                backgroundColor: Colors.white,
                controller: passwordController,
              ),
              DefaultButton(
                buttonText: 'Criar Conta',
                borderSize: 0,
                rota: MainMenuPage(),
                func: () {
                  database.insert(
                    tableName: 'Users',
                    columnNames: [
                      'UserNomeCompleto',
                      'UserEmail',
                      'UserSenha',
                    ],
                    columnValues: [
                      nameController.text.trim(),
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    ],
                  );

                  var result =
                      database.select(tableName: 'Users', isJoin: false);

                  result.then(
                    (List<Map<String, dynamic>> list) {
                      print(list);

                      database.closeDatabase();

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return IsLoggedPage();
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
