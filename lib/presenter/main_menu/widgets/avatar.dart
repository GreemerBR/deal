import 'package:app_2/core/app_assets.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.network(
            imgAvatar,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
