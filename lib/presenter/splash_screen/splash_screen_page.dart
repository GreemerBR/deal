


import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import '../second_splash/splash_screen_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

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
              // imgConverter();
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
