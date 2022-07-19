import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 35),
      child: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 83, 55, 160),
        radius: 45,
        child: Icon(
          Icons.person,
          size: 57,
          color: Color.fromARGB(255, 192, 180, 225),
        ),
      ),
    );
  }
}
