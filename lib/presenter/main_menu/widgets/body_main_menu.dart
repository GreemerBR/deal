import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/app_assets.dart';
import 'categories_cards.dart';
import 'divisor_line.dart';
import 'favorite_icon.dart';
import 'search_bar.dart';
import 'slide_component.dart';
import 'user_card.dart';

class BodyMainMenu extends HookConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 6),
                child: Padding(
                  padding: const EdgeInsets.only(top: 26),
                  child: Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        UserCard(),
                        FavoriteIcon(),
                      ],
                    ),
                  ),
                ),
              ),
              DivisorLine(),
              Padding(
                padding: const EdgeInsets.only(
                    right: 30, left: 30, top: 20, bottom: 10),
                child: Container(
                  child: SearchBar(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                child: SlideComponent(
                  listCarousel: imageListCard,
                ),
              ),
              Container(
                width: 500,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10, left: 10, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CategoriesCards(
                            title: {"Brinquedos" : 1},
                            icon: Icons.toys_outlined,
                          ),
                          CategoriesCards(
                            title: {"Cozinha" : 2},
                            icon: Icons.kitchen_rounded,
                          ),
                          CategoriesCards(
                            title: {"Eletrônicos" : 3},
                            icon: Icons.power_outlined,
                          ),
                          CategoriesCards(
                            title: {"Esportes" : 4},
                            icon: Icons.sports_basketball_rounded,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 500,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10, left: 15, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CategoriesCards(
                            title: {"Lazer" : 5},
                            icon: Icons.outdoor_grill_sharp,
                          ),
                          CategoriesCards(
                            title: {"Moda" : 6},
                            icon: Icons.checkroom,
                          ),
                          CategoriesCards(
                            title: {"Jardim" : 7},
                            icon: Icons.grass,
                          ),
                          CategoriesCards(
                            title: {"Outros" : 8},
                            icon: Icons.more_horiz,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
