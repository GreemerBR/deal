import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../favorites/favorites_page.dart';
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
          icon: Icons.favorite_border_outlined,
          text: 'Favoritos',
          func: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return FavoritesPage();
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
        MainMenuButton(
          icon: Icons.output_sharp,
          text: 'Sair',
          func: () => FirebaseAuth.instance.signOut(),
        ),
      ],
    );
  }
}
