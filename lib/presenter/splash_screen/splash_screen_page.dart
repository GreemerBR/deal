import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/app_assets.dart';
import '../second_splash/splash_screen_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  Future<void> imgConverter() async {
    final List<ByteData> popCornMaker = [
      await rootBundle.load(imgPopcornMaker1),
      await rootBundle.load(imgPopcornMaker2),
      await rootBundle.load(imgPopcornMaker3),
    ];

    ByteData byteData = await rootBundle.load(imgAvatar);
    Uint8List uint8list = byteData.buffer.asUint8List();
    String string = base64Encode(uint8list);

    List<String> lista = [
      base64Encode(popCornMaker[0].buffer.asUint8List()),
      base64Encode(popCornMaker[1].buffer.asUint8List()),
      base64Encode(popCornMaker[2].buffer.asUint8List()),
    ];

    Dio().post(
      "http://192.168.0.94/api/Announce",
      data: {
        "anunTitulo": "Pipoqueira",
        "anunDescri": """Pipoqueira Household Kitchen Máquina de pipoca doce,
          máquina automática de fazer pipoca""",
        "anunCat": "Lazer",
        "anunCep": "89138000",
        "anunEndereco": "Rua Ribeirão São Paulo, 1661",
        "anunData": "15/08/2022",
        "anunValor": 50.00,
        "anunImage1": lista[0],
        "anunImage2": lista[1],
        "anunImage3": lista[2],
        "userId": 2,
      },
    );
  }

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
    ).then(
      (value) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              imgConverter();
              return SecondSplashScreen();
            },
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 66, 191),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  imgLogoApp,
                  scale: 2,
                ),
              ),
            ),
            // Center(
            //   child: CircularProgressIndicator(
            //     color: Colors.white,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
