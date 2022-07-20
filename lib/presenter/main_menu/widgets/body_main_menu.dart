import 'package:flutter/material.dart';
import 'menu_navigation_bar.dart';

class BodyMainMenu extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
            ),
            Container(
              width: double.maxFinite,
              height: 60,
              color: Color.fromARGB(255, 99, 66, 191),
              child: MenuNavigationBar(),
            )
          ],
        ),
      ],
    );
  }
}

