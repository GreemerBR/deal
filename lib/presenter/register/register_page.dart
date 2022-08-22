import 'package:app_2/core/general_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/database.dart';
import '../../main.dart';
import '../is_logged/is_logged_page.dart';
import '../login/widgets/default_button.dart';
import '../login/widgets/default_input.dart';
import '../login/widgets/default_title.dart';
import '../main_menu/main_menu_page.dart';

class Register extends StatefulHookConsumerWidget {

  @override
  ConsumerState<Register> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late ByteData imgDefault;

  Future signUp() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    ref.watch(userStateNotifierProvider.notifier).getUser();
    navigatorKey.currentState!.pop();
  }

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
                func: () async {
                  await DatabaseApp.instance.insert(
                    tableName: 'Users',
                    valuesAndNames: {
                      'UserNomeCompleto': nameController.text.trim(),
                      'UserEmail': emailController.text.trim(),
                      'UserSenha': passwordController.text.trim(),
                      'UserImage': await ref.watch(defaultImageProvider),
                    },
                  );
                  var result = DatabaseApp.instance.select(
                    tableName: 'Users',
                  );
                  result.then(
                    (List<Map<String, dynamic>> list) async {
                      await signUp();
                      ref.watch(userStateNotifierProvider.notifier).getUser();
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
