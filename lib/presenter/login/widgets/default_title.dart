import 'package:flutter/material.dart';

class DefaultTitle extends StatelessWidget {
  const DefaultTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 25,
      child: Text(
        'Empreste agora mesmo',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}