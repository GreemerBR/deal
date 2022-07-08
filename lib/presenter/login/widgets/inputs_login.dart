import 'package:flutter/material.dart';

class DefaultInputWithoutIcon extends StatelessWidget {
  final String texto;

  const DefaultInputWithoutIcon({
    Key? key,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 200, left: 45, right: 45),
      child: TextFormField(
        decoration: InputDecoration(
            filled: true, fillColor: Colors.grey.shade300, labelText: texto
            //borderRadius: BorderRadius.circular(25)),
            ),
      ),
    );
  }
}

class DefaultInputWithIcon extends StatelessWidget {
  final String texto;
  final Icon icon;

  const DefaultInputWithIcon({
    Key? key,
    required this.texto,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 350, left: 45, right: 45),
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
