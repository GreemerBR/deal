import 'package:flutter/material.dart';

import 'widgets/background_image_login.dart';
import 'widgets/buttons_login.dart';
import 'widgets/inputs_login.dart';
import 'widgets/texts_login.dart';

class Login extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                BackgroundImage(),
                PeopleImage(),
                DefaultTitle(),
                DefaultInputWithoutIcon(),
                DefaultInputWithIcon(),
                DefaultButton(),
                DefaultLinkText(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}





