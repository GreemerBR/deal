import 'dart:typed_data';

import 'package:app_2/core/models/user_model.dart';
import 'package:app_2/core/notifiers/user_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userStateNotifierProvider = StateNotifierProvider<UserNotifier, UserModel?>(
  (ref) {
    return UserNotifier();
  },
);
