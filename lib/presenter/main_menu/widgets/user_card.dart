
import 'package:app_2/core/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import 'avatar.dart';

class UserCard extends HookConsumerWidget {
  UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.watch(userStateNotifierProvider);

    return Visibility(
      visible: (userNotifier?.userNomeCompleto ?? '').isNotEmpty,
      replacement: Center(child: CircularProgressIndicator()),
      child: Row(
        children: [
          Avatar(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Olá,",
                style: TextStyle(
                  color: Color.fromARGB(255, 153, 152, 152),
                  fontSize: 16,
                ),
              ),
              Text(
                userNotifier?.userApelido == '' ? userNotifier!.userNomeCompleto : userNotifier!.userApelido,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
