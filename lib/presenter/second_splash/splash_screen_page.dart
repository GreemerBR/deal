import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import '../login/login_page.dart';
import '../login/widgets/default_title.dart';

class SecondSplashScreen extends StatefulWidget {
  const SecondSplashScreen({Key? key}) : super(key: key);

  @override
  State<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {
  @override
  // void initState() {
  //   Future.delayed(
  //     const Duration(seconds: 4),
  //   ).then((value) {
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (context) {
  //           return LoginPage();
  //         },
  //       ),
  //     );
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 66, 191),
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(imgFriendsSplash,
                  fit: BoxFit.cover, alignment: Alignment.centerRight),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(0, 0, 0, 0),
                Color.fromARGB(255, 0, 0, 0),
              ],
            )),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 65),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DefaultTitle(
                    title: 'Bem vindo a Deal',
                    subtitle: 'Emprestar nunca foi tão fácil',
                    colortitle: Color.fromARGB(255, 99, 66, 191),
                    colorSubtitle: Colors.white,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //AnimatedSlideUp(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(_createRoute());
                    },
                    icon: Icon(Icons.keyboard_double_arrow_up_rounded),
                    color: Colors.white,
                    iconSize: 45,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
