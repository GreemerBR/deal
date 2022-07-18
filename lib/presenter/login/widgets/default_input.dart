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
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 45, right: 45),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade300,
          labelText: texto,
          suffixIcon: icon,
        ),
      ),
    );
  }
}
