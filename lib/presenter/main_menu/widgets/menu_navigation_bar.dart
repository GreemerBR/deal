import 'package:flutter/material.dart';

import '../../chat/chat_page.dart';
import '../../login/login.dart';
import '../../myProfile/my_profile.dart';
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
          destinyPage: Login(),
        ),
        MainMenuButton(
          icon: Icons.chat_outlined,
          text: 'Chat',
          destinyPage: ChatPage(),
        ),
        MainMenuButton(
          icon: Icons.person_outline,
          text: 'Perfil',
          destinyPage: MyProfile(),
        ),
      ],
    );
  }
}

