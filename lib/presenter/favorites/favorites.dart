import 'package:flutter/material.dart';

import '../mainMenu/widgets/card_product_ad.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text("Favoritos",
              style: TextStyle(
                fontSize: 30,
              )),
        ),
        backgroundColor: Color.fromARGB(255, 99, 66, 191),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CardProductAd(
              productName: 'Fritadeira Eletrica Nell',
              productPrice: '55',
              productLocation: 'Ponta Aguda - 08/07 às 20:00',
              imageLink: 'assets/images/AirFryer.png',
              isFavorite: true,
            ),
          ],
        ),
      ),
    );
  }
}
