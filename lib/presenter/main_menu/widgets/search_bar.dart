import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Color.fromARGB(255, 192, 180, 225);
    return TextField(
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: 'O que você está procurando?',
        hintStyle: TextStyle(color: Colors.white, fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(10.0)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: color,
            width: 2.0,
          ),
        ),
        filled: true,
        fillColor: color,
        focusColor: color,
        suffixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }
}
