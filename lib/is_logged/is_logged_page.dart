import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../presenter/login/login_page.dart';
import '../presenter/main_menu/main_menu_page.dart';

class IsLoggedPage extends StatefulWidget {
  const IsLoggedPage({Key? key}) : super(key: key);

  @override
  State<IsLoggedPage> createState() => _IsLoggedPageState();
}

class _IsLoggedPageState extends State<IsLoggedPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MainMenuPage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
