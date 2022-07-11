import 'package:flutter/material.dart';

class PeopleImage extends StatelessWidget {
  const PeopleImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      child: Image.asset(
        'assets/images/people.png',
        width: 250,
      ),
    );
  }
}