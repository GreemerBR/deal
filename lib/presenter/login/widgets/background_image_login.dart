
import 'package:app_2/core/app_assets.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(imgBackgroundLogin),
            fit: BoxFit.fitWidth,
            alignment: Alignment(1, -1)),
      ),
    );
  }
}

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