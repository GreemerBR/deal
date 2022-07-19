import 'package:flutter/material.dart';

import 'widgets/body_welcome_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyWelcome(),
    );
  }
}

