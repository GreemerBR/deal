import 'package:app_2/core/models/user_model.dart';
import 'package:app_2/core/notifiers/user_notifier.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_assets.dart';

final userStateNotifierProvider =
    StateNotifierProvider<UserNotifier, UserModel?>(
  (ref) {
    return UserNotifier();
  },
);

final defaultImageProvider = Provider(
  (ref) async {
    ByteData imgDefault = await rootBundle.load(imgAvatar);
    return imgDefault.buffer.asUint8List();
  },
);
