import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/general_providers.dart';
import '../../my_profile/my_profile_page.dart';

class Avatar extends StatefulHookConsumerWidget {
  Avatar({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<Avatar> createState() => _AvatarState();
}

class _AvatarState extends ConsumerState<Avatar> {
  late var infoImage = ref.watch(userStateNotifierProvider)!.userImage;

  Uint8List callImage() {
    return base64Decode(infoImage);
  }

  @override
  Widget build(BuildContext context) {
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
          callImage(),
          width: 90,
          height: 90,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
