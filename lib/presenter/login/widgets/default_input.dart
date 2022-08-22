import 'package:flutter/material.dart';

class DefaultInput extends StatefulWidget {
  static const Color grey = Color.fromRGBO(224, 224, 224, 1);
  final String texto;
  final Icon icon;
  final Color textColor;
  final Color backgroundColor;
  final TextEditingController? controller;
  final bool password;

  const DefaultInput(
      {Key? key,
      required this.texto,
      this.icon = const Icon(Icons.check_box_outline_blank_rounded),
      this.textColor = Colors.black,
      this.backgroundColor = grey,
      this.controller,
      this.password = false})
      : super(key: key);

  @override
  State<DefaultInput> createState() => _DefaultInputState();
}

class _DefaultInputState extends State<DefaultInput> {
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
   
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        border: Border(
          top: BorderSide(color: Color.fromARGB(255, 196, 196, 196)),
          bottom: BorderSide(color: Color.fromARGB(255, 196, 196, 196)),
          left: BorderSide(color: Color.fromARGB(255, 196, 196, 196)),
          right: BorderSide(color: Color.fromARGB(255, 196, 196, 196)),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          controller: widget.controller,
          obscureText: !_passwordVisible && widget.password,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            filled: true,
            fillColor: widget.backgroundColor,
            labelText: widget.texto,
            labelStyle: TextStyle(color: widget.textColor),
            suffixIcon: IconButton(
                onPressed: () => setState(
                      () {
                        _passwordVisible = !_passwordVisible;
                      },
                    ),
                icon: widget.icon,
                color: widget.password
                    ? widget.textColor
                    : widget.backgroundColor),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
