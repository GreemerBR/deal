import 'package:app_2/presenter/login/widgets/default_title.dart';
import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import '../login/login_page.dart';

class SecoundSplashScreen extends StatefulWidget {
  const SecoundSplashScreen({Key? key}) : super(key: key);

  @override
  State<SecoundSplashScreen> createState() => _SecoundSplashScreenState();
}

class _SecoundSplashScreenState extends State<SecoundSplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 4),
    ).then((value) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ),
      );
    });
    super.initState();
  }

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
                  CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
