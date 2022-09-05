// ignore_for_file: must_be_immutable

import 'dart:typed_data';

import 'package:app_2/core/app_assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/database.dart';
import '../../../../core/general_providers.dart';

// final imageStateProvider = StateProvider((ref) {
//   return Uint8List();
// });

// ignore: must_be_immutable
class ProfileSummaryInformationsEditor extends StatefulHookConsumerWidget {
  Uint8List? image;
  ProfileSummaryInformationsEditor({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  ConsumerState<ProfileSummaryInformationsEditor> createState() =>
      _ProfileSummaryInformationsEditorState();
}

class _ProfileSummaryInformationsEditorState
    extends ConsumerState<ProfileSummaryInformationsEditor> {
  late var userInfo = ref.watch(userStateNotifierProvider)!;
  late Future<List<Map<String, dynamic>>> list;
  
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                widget.image ?? callImage(userInfo.userImage),
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                userInfo.userNomeCompleto,
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
              child: Text(
                "${userInfo.userCidade} - ${userInfo.userEstado}",
                style: TextStyle(
                  color: Color.fromARGB(255, 196, 196, 196),
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
