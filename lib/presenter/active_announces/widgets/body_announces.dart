import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';

class BodyAnnounces extends StatelessWidget {
  const BodyAnnounces({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                imgCamera,
                height: 150,
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Você não tem anúncios ativos",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 196, 196, 196),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bora emprestar?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 196, 196, 196),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 80,
          width: double.maxFinite,
          color: Color.fromARGB(255, 99, 66, 191),
          alignment: Alignment.center,
          child: Text(
            "ADICIONAR ANÚNCIOS",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
