import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 490),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 99, 66, 191),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'ACESSAR',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}