import 'package:flutter/material.dart';

class BottomAnnounceButton extends StatelessWidget {
  final Function()? func;

  const BottomAnnounceButton({
    Key? key,
    this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      hoverColor: Colors.purple.shade800,
      focusColor: Colors.purple.shade800,
      minWidth: 250,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      height: 65,
      color: Color.fromRGBO(99, 66, 191, 1),
      onPressed: func,
      child: Text(
        "Enviar Anúncio ",
        style: TextStyle(
          fontSize: 23,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
