import 'package:dio/dio.dart';
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
      Dio dio = Dio();
      final responseUserId = await dio.get('http://zuplae.vps-kinghost.net:8082/api/user/email/${user.email}');
      var userId = responseUserId.data.toString();

      var userMap = await dio.get("http://zuplae.vps-kinghost.net:8082/api/user/${userId}");

      state = UserModel.fromMap(userMap.data);      
    }
  } 
}
