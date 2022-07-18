import 'package:flutter/material.dart';

class DefaultTitle extends StatelessWidget {
  const DefaultTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Já possui sua conta?',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        Text(
          'Entre agora mesmo',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
