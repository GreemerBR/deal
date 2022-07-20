import 'package:flutter/material.dart';

import 'avatar.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Avatar(),
          ],
        ),
        SizedBox(width: 14),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Olá,",
              style: TextStyle(
                color: Color.fromARGB(255, 153, 152, 152),
                fontSize: 16,
              ),
            ),
            Text(
              "Gregory Viegas Zimmer",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
