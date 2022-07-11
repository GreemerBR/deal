import 'package:app_2/core/app_assets.dart';
import 'package:flutter/material.dart';

import 'card_product_ad.dart';

class MainMenuCards extends StatelessWidget {
  const MainMenuCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardProductAd(
          productName: 'Projetor BenQ - USB HDMI',
          productPrice: '30',
          productLocation: 'Centro - 25/02 às 19:25',
          imageLink: imgProjector,
        ),
        CardProductAd(
          productName: 'Máquina Singer Lux',
          productPrice: '100',
          productLocation: 'Ponta Aguda - 08/07 às 20:00',
          imageLink: imgSewingMachine,
        ),
        CardProductAd(
          productName: 'Filtro água Esmaltec 2000',
          productPrice: '40',
          productLocation: 'Baixo Alto - 04/06 às 21:00',
          imageLink: imgWaterFilter,
        ),
        CardProductAd(
          productName: 'Fritadeira Eletrica Nell',
          productPrice: '55',
          productLocation: 'Ponta Aguda - 08/07 às 20:00',
          imageLink: imgAirFryer,
          isFavorite: true,
        ),
        CardProductAd(
          productName: 'Pipoqueira pop time Britania',
          productPrice: '25',
          productLocation: 'Ponta Aguda - 08/07 às 20:00',
          imageLink: imgPopcornMaker,
        ),
        CardProductAd(
          productName: 'Sanduicheira Britania',
          productPrice: '12',
          productLocation: 'Ponta Aguda - 08/07 às 20:00',
          imageLink: imgSandwichMaker,
        ),
        CardProductAd(
          productName: 'Boneco Benio 9',
          productPrice: '45',
          productLocation: 'Ponta Aguda - 08/07 às 20:00',
          imageLink: imgBen10,
        ),
        CardProductAd(
          productName: 'Máquina Brastemp de Lavar',
          productPrice: '87',
          productLocation: 'Ponta Aguda - 08/07 às 20:00',
          imageLink: imgWashingMachine,
        ),
      ],
    );
  }
}
