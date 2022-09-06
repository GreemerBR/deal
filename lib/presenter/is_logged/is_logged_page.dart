import '../../core/general_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../login/login_page.dart';
import '../main_menu/main_menu_page.dart';

class IsLoggedPage extends StatefulHookConsumerWidget {
  const IsLoggedPage({Key? key}) : super(key: key);

  @override
  ConsumerState<IsLoggedPage> createState() => _IsLoggedPageState();
}

class _IsLoggedPageState extends ConsumerState<IsLoggedPage> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userStateNotifierProvider);
    if (user == null) {
        FirebaseAuth.instance.signOut();
      }
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Alguma coisa deu errado...'),
          );
        } else if (snapshot.hasData) {
          return MainMenuPage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
