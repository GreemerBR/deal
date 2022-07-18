import 'package:flutter/material.dart';

class DefaultInput extends StatelessWidget {
  final String texto;
  final Icon? icon;

  const DefaultInput({
    Key? key,
    required this.texto,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          filled: true,
          fillColor: Colors.grey.shade300,
          labelText: texto,
          suffixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
