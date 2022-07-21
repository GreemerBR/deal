import 'icon_filter.dart';
import 'package:flutter/material.dart';
import '../../../core/app_assets.dart';
import '../../categories/categories_page.dart';
import 'categories_cards.dart';
import 'divisor_line.dart';
import 'menu_navigation_bar.dart';
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
              padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UserCard(),
                      FilterIcon(),
                    ],
                  ),
                ),
              ),
            ),
            DivisorLine(),
            Padding(
              padding: const EdgeInsets.only(
                  right: 30, left: 30, top: 20, bottom: 20),
              child: Container(
                child: SearchBar(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30, bottom: 20),
              child: SlideComponent(
                listCarousel: imageList,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoriesCards(
                    title: "Brinquedos",
                    icon: Icons.toys_outlined,
                    destinyPage: CategoriesPage(),
                  ),
                  CategoriesCards(
                    title: "Cozinha",
                    icon: Icons.kitchen_outlined,
                    destinyPage: CategoriesPage(),
                  ),
                  CategoriesCards(
                    title: "Eletrônicos",
                    icon: Icons.power_outlined,
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
        Container(
          width: double.maxFinite,
          height: 60,
          color: Color.fromARGB(255, 99, 66, 191),
          child: MenuNavigationBar(),
        )
      ],
    );
  }
}
