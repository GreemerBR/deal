import 'package:flutter/material.dart';

import '../../main_menu/main_menu_page.dart';

class DefaultButton extends StatelessWidget {
  final Widget rota;
  final String buttonText;
  final double borderSize;

  const DefaultButton({
    Key? key,
    required this.rota,
    required this.buttonText,
    this.borderSize = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return rota;
            },
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 99, 66, 191),
        side: BorderSide(
          width: borderSize,
          color: Colors.white,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
