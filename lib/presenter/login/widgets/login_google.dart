import 'package:app_2/presenter/my_profile/my_profile_page.dart';
import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return MyProfilePage();
            },
          ),
        );
      },
      icon: Image.asset(
        imgLoginGoogle,
        fit: BoxFit.cover,
      ),
      iconSize: 150,
    );
  }
}
