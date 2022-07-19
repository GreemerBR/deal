import 'package:flutter/material.dart';

class DefaultTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color colortitle;
  final Color colorSubtitle;

  const DefaultTitle({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.colortitle,
    required this.colorSubtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 25,
            color: colortitle,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 20,
            color: colorSubtitle,
          ),
        ),
      ],
    );
  }
}
