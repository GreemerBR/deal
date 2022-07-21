import 'package:flutter/material.dart';

import '../../register/register_page.dart';

class DefaultLinkText extends StatelessWidget {
  const DefaultLinkText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return Register();
              },
            ),
          );
        },
        child: Text(
          "Registre-se agora",
          style: TextStyle(
            fontSize: 15,
            decoration: TextDecoration.underline,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
