import 'dart:convert';
<<<<<<< HEAD
import 'dart:typed_data';
=======
>>>>>>> 5dbe6e7cc5fa1d67892b2da41f9f3d4186794178

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
<<<<<<< HEAD
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
=======

//   void callDio() async{
//      final ByteData bytesImgAvatar = await rootBundle.load(imgAvatar);

//     Dio().put("http://zuplae.vps-kinghost.net:8082/api/user", data: {
// 	"userNomeCompleto": "Admin",
// 	"userEmail": "adm@gmail.com",
// 	"userSenha": "2F648D8692227A0EA435AB49802DA827",
// 	"userApelido": "UsuárioTeste",
// 	"userCpf": "123.456.789-00",
// 	"userTelefone": "47999999999",
// 	"userCep": "89010-204",
// 	"userEstado": "Santa Catarina",
// 	"userCidade": "Blumenau",
// 	"userBairro": "Centro",
// 	"userRua": "R. 7 de Setembro",
// 	"userComplemento": "Tarumã Office",
// 	"userNumero": 24,
// 	"userImage": base64Encode(bytesImgAvatar.buffer.asUint8List()),
// 	"id": 2
// });
//   }
>>>>>>> 5dbe6e7cc5fa1d67892b2da41f9f3d4186794178

  @override
  void initState() {
  //  callDio();
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
