import 'package:flutter/material.dart';

class DefaultTitle extends StatelessWidget {
  const DefaultTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 365,
      child: Text(
        'Empreste agora mesmo',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}

class DefaultLinkText extends StatelessWidget {
  const DefaultLinkText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 600),
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

