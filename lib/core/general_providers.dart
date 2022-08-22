import 'dart:typed_data';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final userImageStateProvider = StateProvider(
  (ref) {
    return Uint8List(10);
  },
);
