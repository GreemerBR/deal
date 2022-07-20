import 'package:flutter/material.dart';


class DivisorLine extends StatelessWidget {
  const DivisorLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Color.fromARGB(255, 153, 152, 152);
    return Container(
      height: 1,
      margin: EdgeInsets.only(right: 30, left: 30, top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
      )
    );
  }
}
