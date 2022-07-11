import 'package:flutter/material.dart';

class DefaultLinkText extends StatelessWidget {
  const DefaultLinkText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Text(
        "Registre-se agora",
        style: TextStyle(
          fontSize: 15,
          decoration: TextDecoration.underline,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}

