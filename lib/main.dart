import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'presenter/splash_screen/splash_screen_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      title: 'Deal',
      home: SplashScreenPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
