import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../chat/chat_page.dart';
import '../../login/login_page.dart';
import '../../my_profile/my_profile_page.dart';
import 'main_menu_button.dart';

class MenuNavigationBar extends StatelessWidget {
  const MenuNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MainMenuButton(
          icon: Icons.arrow_back,
          text: 'Sair',
          func: () => FirebaseAuth.instance.signOut(),
        ),
        MainMenuButton(
          icon: Icons.chat_outlined,
          text: 'Chat',
          func: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ChatPage();
                },
              ),
            );
          },
        ),
        MainMenuButton(
          icon: Icons.person_outline,
          text: 'Perfil',
          func: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return MyProfilePage();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
