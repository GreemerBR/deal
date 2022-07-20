import 'package:flutter/material.dart';

class CategoriesCards extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoriesCards({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Color.fromARGB(255, 192, 180, 225);
    const textColor = Color.fromARGB(255, 153, 152, 152);
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            Icon(
              icon,
              size: 35,
              color: Colors.white,
            ),
          ],
        ),
        Text(
          title,
          style: TextStyle(
            color: textColor,
          ),
        )
      ],
    );
  }
}
