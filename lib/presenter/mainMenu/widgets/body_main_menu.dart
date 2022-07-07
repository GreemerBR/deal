import 'package:flutter/material.dart';

class BodyMainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: 125,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 125,
                      width: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/projetor.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(10),
                          )),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text('Projetor BenQ - USB HDMI'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
