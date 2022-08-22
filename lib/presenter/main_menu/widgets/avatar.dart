import 'package:app_2/core/general_providers.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/database.dart';
import '../../my_profile/my_profile_page.dart';

class Avatar extends StatefulHookConsumerWidget {
  Avatar({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<Avatar> createState() => _AvatarState();
}

class _AvatarState extends ConsumerState<Avatar> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DatabaseApp.instance.select(
        tableName: 'Users',
      ),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (!snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: CircularProgressIndicator(),
          );
        }
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
              ref.watch(userStateNotifierProvider)!.userImage!,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
