import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/app_assets.dart';
import '../../my_profile/my_profile_page.dart';

class Avatar extends StatefulWidget {
  Avatar({
    Key? key,
  }) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  Future<Uint8List> image() async {
    final ByteData bytes = await rootBundle.load(imgAvatar);
    return bytes.buffer.asUint8List();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: image(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // print(snapshot.data);
          return MaterialButton(
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
              child: Image.memory(
                snapshot.data as Uint8List,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
