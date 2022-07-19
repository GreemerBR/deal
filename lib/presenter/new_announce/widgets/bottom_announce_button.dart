import 'package:flutter/material.dart';

import '../../main_menu/main_menu_page.dart';

class BottomAnnounceButton extends StatelessWidget {
  const BottomAnnounceButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
    hoverColor: Colors.purple.shade800,
    focusColor: Colors.purple.shade800,
    minWidth: 250,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    height: 65,
    color: Color.fromARGB(255, 99, 66, 191),
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return MainMenuPage();
          },
        ),
      );
    },
    child: Text(
      "Enviar Anúncio ",
      style: TextStyle(
        fontSize: 23,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
        );
  }
}

