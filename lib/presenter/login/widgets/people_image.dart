import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';

class PeopleImage extends StatelessWidget {
  const PeopleImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      child: Image.asset(
        imgPeopleLogin,
        width: 250,
      ),
    );
  }
}