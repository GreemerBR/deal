import 'package:flutter/material.dart';
// import '../../main_menu/widgets/card_product_ad.dart';

class BodyFavorites extends StatelessWidget {
  const BodyFavorites({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          // CardProductAd(
          //   productName: 'Fritadeira Eletrica Nell',
          //   productPrice: '55',
          //   productLocation: 'Ponta Aguda - 08/07 às 20:00',
          //   imageLink: imgAirFryer,
          //   isFavorite: true,
          // ),
        ],
      ),
    );
  }
}
