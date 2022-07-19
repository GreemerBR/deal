import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultInput extends StatelessWidget {
  static const Color grey = Color.fromRGBO(224, 224, 224, 1);
  final String texto;
  final Icon? icon;
  final Color textColor;
  final Color backgroundColor;

  const DefaultInput({
    Key? key,
    required this.texto,
    this.icon,
    this.textColor = Colors.black,
    this.backgroundColor = grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          filled: true,
          fillColor: backgroundColor,
          labelText: texto,
          labelStyle: TextStyle(color: textColor),
          suffixIcon: icon,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
