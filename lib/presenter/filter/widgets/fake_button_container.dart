import 'package:flutter/material.dart';

import '../../main_menu/main_menu_page.dart';

class FakeButtonContainer extends StatelessWidget {
  const FakeButtonContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          hoverColor: Colors.purple.shade800,
          focusColor: Colors.purple.shade800,
          minWidth: 250,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          height: 65,
          color: Color.fromARGB(255, 99, 66, 191),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Filtrar",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
