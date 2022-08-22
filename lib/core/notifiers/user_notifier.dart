import 'package:app_2/core/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user_model.dart';

class UserNotifier extends StateNotifier<UserModel?> {
  UserNotifier() : super(null) {
    getUser();
  }

  Future<void> getUser() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final userMap = await DatabaseApp.instance.select(
        tableName: 'Users',
        condition: 'UserEmail = "${user.email}"',
      );

      state = UserModel.fromMap(userMap[0]);

      
    }
  }
}
