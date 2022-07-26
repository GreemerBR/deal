import 'core/get_it.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'presenter/splash_screen/splash_screen_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupDependencies();
  runApp(
    MaterialApp(
      title: 'Deal',
      home: SplashScreenPage(),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
    ),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();
