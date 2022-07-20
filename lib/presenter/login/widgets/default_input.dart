import 'package:flutter/material.dart';

class DefaultInput extends StatelessWidget {
  static const Color grey = Color.fromRGBO(224, 224, 224, 1);
  final String texto;
  final Icon? icon;
  final Color textColor;
  final Color backgroundColor;
  final TextEditingController? controller;
  final bool password;

  const DefaultInput(
      {Key? key,
      required this.texto,
      this.icon,
      this.textColor = Colors.black,
      this.backgroundColor = grey,
      this.controller,
      this.password = false})
      : super(key: key);

  // void showPassword() {
  //   if (!password) {
  //     password;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: password,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          filled: true,
          fillColor: backgroundColor,
          labelText: texto,
          labelStyle: TextStyle(color: textColor),
          suffixIcon: icon,
          //TODO Fazer esse botão atvar e desativar o obscureText
          // IconButton(
          //     onPressed: () => showPassword(),
          //     icon: Icon(Icons.remove_red_eye)),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
