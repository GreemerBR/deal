import 'package:flutter/material.dart';

import 'widgets/circle_avatar.dart';
import 'widgets/default_link_text.dart';
import 'widgets/default_title.dart';
import 'widgets/login_google.dart';
import 'widgets/login_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 66, 191),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTitle(
                title: 'Já possui conta?',
                subtitle: 'Entre agora mesmo',
                colortitle: Colors.white,
                colorSubtitle: Colors.white,
              ),
              ProfileAvatar(),
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
