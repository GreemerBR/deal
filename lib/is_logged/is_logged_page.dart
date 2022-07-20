import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../presenter/login/login_page.dart';
import '../presenter/main_menu/main_menu_page.dart';

class IsLoggedPage extends StatefulWidget {
  const IsLoggedPage({Key? key}) : super(key: key);

  @override
  State<IsLoggedPage> createState() => _IsLoggedPageState();
}

class _IsLoggedPageState extends State<IsLoggedPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MainMenuPage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}

// Route createRoute() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => IsLoggedPage(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(0.0, 1.0);
//       const end = Offset.zero;
//       const curve = Curves.ease;

//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }
