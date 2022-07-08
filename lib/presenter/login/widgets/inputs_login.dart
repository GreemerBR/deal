import 'package:flutter/material.dart';

class DefaultInputWithoutIcon extends StatelessWidget {
  const DefaultInputWithoutIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 200, left: 45, right: 45),
      child: TextFormField(
        decoration: InputDecoration(
            filled: true, fillColor: Colors.grey.shade300, labelText: "Login"
            //borderRadius: BorderRadius.circular(25)),
            ),
      ),
    );
  }
}

class DefaultInputWithIcon extends StatelessWidget {
  const DefaultInputWithIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 350, left: 45, right: 45),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade300,
          labelText: "Senha",
          suffixIcon: Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}

