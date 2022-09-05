
import 'package:app_2/core/general_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/app_assets.dart';

class ProfileSummaryInformations extends StatefulHookConsumerWidget {
  ProfileSummaryInformations({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ProfileSummaryInformations> createState() =>
      _ProfileSummaryInformationsState();
}

class _ProfileSummaryInformationsState
    extends ConsumerState<ProfileSummaryInformations> {
  late var userInfo = ref.watch(userStateNotifierProvider)!;
  late Future<List<Map<String, dynamic>>> list;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final userNotifier = ref.watch(userStateNotifierProvider);
    return Visibility(
      visible: (userNotifier?.userNomeCompleto ?? '').isNotEmpty,
      replacement: Center(child: CircularProgressIndicator()),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 99, 66, 191),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.memory(
                  callImage(userNotifier!.userImage),
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  userInfo.userApelido == ''
                      ? userInfo.userNomeCompleto
                      : userInfo.userApelido,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userNotifier.userCidade,
                      style: TextStyle(
                        color: Color.fromARGB(255, 196, 196, 196),
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      ' - ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 196, 196, 196),
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      userNotifier.userEstado,
                      style: TextStyle(
                        color: Color.fromARGB(255, 196, 196, 196),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
