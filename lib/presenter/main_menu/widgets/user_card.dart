import 'package:flutter/material.dart';

import 'avatar.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          //decoration: BoxDecoration(color: Colors.blue),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Avatar(),
            ],
          ),
        ),
        SizedBox(width: 12),
        Container(
          //decoration: BoxDecoration(color: Colors.yellow),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Olá,",
                style: TextStyle(color: Color.fromARGB(255, 153, 152, 152)),
              ),
              Text(
                "Gregory Viegas Zimmer",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
