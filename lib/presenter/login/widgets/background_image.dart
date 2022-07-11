
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
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(imgBackgroundLogin),
            fit: BoxFit.fitWidth,
            alignment: Alignment(1, -1)),
      ),
    );
  }
}
<<<<<<< HEAD:lib/presenter/login/widgets/background_image_login.dart

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
=======
>>>>>>> 7b5c51e2c9a828160b1b1e2e887982b6cd5a27c6:lib/presenter/login/widgets/background_image.dart
