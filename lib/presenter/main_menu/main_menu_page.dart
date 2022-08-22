import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/body_main_menu.dart';

class MainMenuPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: BodyMainMenu(),
    );
  }
}
