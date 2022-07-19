import '../../../core/app_assets.dart';
import 'package:flutter/material.dart';

class BodyWelcome extends StatelessWidget {
  const BodyWelcome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.darken,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/welcome.jpg'),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, bottom: 80),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Bem vindo a ',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 25,
                          color: Color.fromARGB(255, 192, 180, 225),
                        ),
                      ),
                      Text(
                        'Deal',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 25,
                            color: Color.fromARGB(255, 192, 180, 225),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Emprestar nunca foi tão facil",
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                alignment: Alignment.center,
                child: IconButton(
                  color: Colors.white,
                  icon: const Icon(
                    Icons.keyboard_arrow_up,
                    size: 40,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
