import 'package:app_2/core/app_assets.dart';
import 'package:app_2/core/get_it.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/database.dart';
import 'widgets/circle_avatar.dart';
import 'widgets/default_link_text.dart';
import 'widgets/default_title.dart';
import 'widgets/login_google.dart';
import 'widgets/login_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final database = getIt.get<DatabaseApp>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 66, 191),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 35),
              DefaultTitle(
                title: 'Já possui conta?',
                subtitle: 'Entre agora mesmo',
                colortitle: Colors.white,
                colorSubtitle: Colors.white,
              ),
              // ProfileAvatar(),
              SizedBox(height: 10),
              Lottie.asset(
                loginAnimation,
                repeat: false,
                width: 120,
                height: 120,
                fit: BoxFit.fill,
              ),
              LoginWidget(),
              GoogleButton(),
              DefaultLinkText(),
            ],
          ),
        ),
      ),
    );
  }
}
