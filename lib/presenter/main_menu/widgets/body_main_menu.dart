import 'favorite_icon.dart';
import 'package:flutter/material.dart';
import '../../../core/app_assets.dart';
import '../../categories/categories_page.dart';
import 'categories_cards.dart';
import 'divisor_line.dart';
import 'search_bar.dart';
import 'user_card.dart';
import 'slide_component.dart';

class BodyMainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                        const EdgeInsets.only(right: 10, left: 10,top:20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CategoriesCards(
                          title: "Brinquedos",
                          icon: Icons.toys_outlined,
                          destinyPage: CategoriesPage(),
                        ),
                        CategoriesCards(
                          title: "Cozinha",
                          icon: Icons.kitchen_rounded,
                          destinyPage: CategoriesPage(),
                        ),
                        CategoriesCards(
                          title: "Eletrônicos",
                          icon: Icons.power_outlined,
                          destinyPage: CategoriesPage(),
                        ),
                        CategoriesCards(
                          title: "Esportes",
                          icon: Icons.sports_basketball_rounded,
                          destinyPage: CategoriesPage(),
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
                          title: "Lazer",
                          icon: Icons.outdoor_grill_sharp,
                          destinyPage: CategoriesPage(),
                        ),
                        CategoriesCards(
                          title: "Moda",
                          icon: Icons.checkroom,
                          destinyPage: CategoriesPage(),
                        ),
                        CategoriesCards(
                          title: "Jardim",
                          icon: Icons.grass,
                          destinyPage: CategoriesPage(),
                        ),
                        CategoriesCards(
                          title: "Outros",
                          icon: Icons.more_horiz,
                          destinyPage: CategoriesPage(),
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
    );
  }
}
