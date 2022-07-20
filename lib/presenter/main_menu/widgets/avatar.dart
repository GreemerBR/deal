import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            'assets/images/Avatar.jpeg',
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
