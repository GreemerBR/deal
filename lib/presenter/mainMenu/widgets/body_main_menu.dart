import 'package:app_2/presenter/myProfile/my_profile.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD

=======
>>>>>>> ffd8728c740105ff31cd1ff5262233e55eb18ff1
import '../../chat/chat_box.dart';
import '../../login/login.dart';
import 'card_product_ad.dart';
import 'main_menu_button.dart';

class BodyMainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
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
                  imageLink: 'assets/images/ben10.png'),
              CardProductAd(
                productName: 'Máquina Brastemp de Lavar',
                productPrice: '87',
                productLocation: 'Ponta Aguda - 08/07 às 20:00',
                imageLink: 'assets/images/Brastemp.png',
              ),
            ],
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 60,
          color: Color.fromARGB(
            255,
            99,
            66,
            191,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MainMenuButton(
                icon: Icons.arrow_back,
                text: 'Sair',
                destinyPage: Login(),
              ),
              MainMenuButton(
                icon: Icons.chat_outlined,
                text: 'Chat',
                destinyPage: ChatBox(),
              ),
              MainMenuButton(
                icon: Icons.person_outline,
                text: 'Perfil',
                destinyPage: MyProfile(),
              ),
              MainMenuButton(
                icon: Icons.more_horiz,
                text: 'Mais',
                destinyPage: Login(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
