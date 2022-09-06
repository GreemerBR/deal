import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/app_assets.dart';
import '../../core/general_providers.dart';
import '../../main.dart';
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
                  ByteData byteData = await rootBundle.load(imgAvatar);
                  Uint8List listAvatarDefault = byteData.buffer.asUint8List();

                  Map<String, dynamic> headers = {
                    "accept": 'Application/json',
                  };

                  Map<String, dynamic> body = {
                    'userNomeCompleto': nameController.text,
                    'userEmail': emailController.text,
                    'userSenha': passwordController.text,
                    'userImage': base64Encode(listAvatarDefault),
                  };

                  Response response;
                  Dio dio = Dio();

                  response = await dio.post(
                    "http://zuplae.vps-kinghost.net:8082/api/user",
                    data: body,
                    options: Options(headers: headers),
                  );
                  print(
                    response.data.toString(),
                  );
                  signUp();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
