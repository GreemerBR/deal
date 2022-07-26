import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';
import 'button_new_announce.dart';

class BodyAnnounces extends StatelessWidget {
  const BodyAnnounces({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      // alignment: Alignment.bottomCenter,
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height - 80,
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  imgCamera,
                  height: 150,
                ),
                SizedBox(height: 50),
                Text(
                  "Você não tem anúncios ativos",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 196, 196, 196),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Bora emprestar?",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 196, 196, 196),
                  ),
                ),
                ButtonNewAnnounce(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
