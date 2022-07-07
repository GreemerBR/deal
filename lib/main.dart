import 'package:flutter/material.dart';

import 'presenter/mainMenu/main_menu.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Deal',
      debugShowCheckedModeBanner: false,
      home: MainMenu(),
    ),
  );
}
