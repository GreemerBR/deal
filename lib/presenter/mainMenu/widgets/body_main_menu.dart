import 'package:flutter/material.dart';

import 'card_product_ad.dart';

class BodyMainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          CardProductAd(
            productName: 'Projetor BenQ - USB HDMI',
            productPrice: '30',
            productLocation: 'Centro - 25/02 às 19:25',
            imageLink: 'assets/images/projetor.png',
          ),
          CardProductAd(
            productName: 'Máquina Singer Lux',
            productPrice: '100',
            productLocation: 'Ponta Aguda - 08/07 às 20:00',
            imageLink: 'assets/images/maquinadecostura.jpg',
          ),
          CardProductAd(
            productName: 'Filtro água Esmaltec 2000',
            productPrice: '40',
            productLocation: 'Baixo Alto - 04/06 às 21:00',
            imageLink: 'assets/images/filtroagua.png',
          ),
          CardProductAd(
            productName: 'Fritadeira Eletrica Nell',
            productPrice: '55',
            productLocation: 'Ponta Aguda - 08/07 às 20:00',
            imageLink: 'assets/images/maquinadecostura.jpg',
          ),
          CardProductAd(
            productName: 'Pipoqueira pop time Britania',
            productPrice: '25',
            productLocation: 'Ponta Aguda - 08/07 às 20:00',
            imageLink: 'assets/images/pipoqueira.jpeg',
          ),
          CardProductAd(
            productName: 'Sanduicheira Britania',
            productPrice: '12',
            productLocation: 'Ponta Aguda - 08/07 às 20:00',
            imageLink: 'assets/images/sanduicheira.jpeg',
          ),
          CardProductAd(
            productName: 'Boneco Benio 9',
            productPrice: '45',
            productLocation: 'Ponta Aguda - 08/07 às 20:00',
            imageLink: 'assets/images/ben10.png'
          ),
          CardProductAd(
            productName: 'Máquina Brastemp de Lavar',
            productPrice: '87',
            productLocation: 'Ponta Aguda - 08/07 às 20:00',
            imageLink: 'assets/images/Brastemp.png',
          ),
        ],
      ),
    );
  }
}
