import 'package:flutter/material.dart';

import '../../main_menu/main_menu_page.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return MainMenuPage();
            },
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 99, 66, 191),
        side: BorderSide(
          width: 2.0,
          color: Colors.white,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          'ACESSAR',
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
