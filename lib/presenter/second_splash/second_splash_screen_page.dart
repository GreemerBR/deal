import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/app_assets.dart';
import '../../core/general_providers.dart';
import '../is_logged/is_logged_page.dart';
import '../login/widgets/default_title.dart';
import 'widgets/animated_slide_up.dart';

class SecondSplashScreen extends StatefulHookConsumerWidget {
  const SecondSplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends ConsumerState<SecondSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) async{
        int sensitivity = 8;
        if (details.delta.dy < -sensitivity) {
          ref.read(userStateNotifierProvider.notifier).getUser();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return IsLoggedPage();
              },
            ),
          );
        }
        ;
      },
      child: Scaffold(
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
                ),
              ),
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
                    SizedBox(height: 35),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: AnimatedSlideUp(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
