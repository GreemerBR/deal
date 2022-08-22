import 'package:app_2/core/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user_model.dart';

class UserNotifier extends StateNotifier<UserModel?> {
  UserNotifier() : super(null) {
    getUser();
  }

  Future<void> getUser() async {
    final userMap = await DatabaseApp.instance.select(
      tableName: 'Users',
      condition: 'UserEmail = ${FirebaseAuth.instance.currentUser!.email}',
    );
    state = UserModel.fromMap(userMap[0]);
  }
}
