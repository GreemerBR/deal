import 'package:flutter/material.dart';

class BodyChat extends StatelessWidget {
  const BodyChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/chatzinho.png',
          height: 150,
        ),
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Você não tem chats ativos",
              style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 196, 196, 196),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Que tal buscarmos novas oportunidades?",
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 196, 196, 196),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
