import 'package:app_2/presenter/mainMenu/main_menu.dart';
import 'package:flutter/material.dart';

import 'presenter/favorites/favorites.dart';
import 'presenter/login/login.dart';

void main() {
  runApp(MaterialApp(
    title: 'Deal',
    home: MainMenu(),
    debugShowCheckedModeBanner: false,
  ),
 );
}
