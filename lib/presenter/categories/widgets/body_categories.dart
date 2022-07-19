import 'package:flutter/material.dart';

import 'main_menu_cards.dart';

class BodyCategories extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: MainMenuCards(),
        ),
      ],
    );
  }
}

