import 'package:flutter/material.dart';

import 'widgets/body_main_menu.dart';

class MainMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: BodyMainMenu(),
      // bottomNavigationBar: MenuNavigationBar(),
    );
  }
}
