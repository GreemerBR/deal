import 'package:flutter/material.dart';

import '../../my_profile/my_profile_page.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return MyProfilePage();
                },
              ),
            );
          },
          child: ClipOval(
            child: Image.asset(
              'assets/images/Avatar.jpeg',
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
