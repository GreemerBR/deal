import 'package:app_2/presenter/favorites/favorites.dart';
import 'package:app_2/presenter/filtro/filterPage.dart';
import 'package:flutter/material.dart';

import 'widgets/body_main_menu.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        leading: SizedBox(),
        leadingWidth: 0,
        title: Expanded(
          child: Container(
            margin: EdgeInsets.all(15),
            height: 45,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Color.fromARGB(
                255,
                192,
                180,
                225,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'O que você está buscando?',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Icon(
                  Icons.search,
                  size: 20,
                )
              ],
            ),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return Favorites();
                      },
                    ),
                  );
                },
                icon: Icon(
                  Icons.favorite_outline,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return FilterPage();
                      },
                    ),
                  );
                },
                icon: Icon(
                  Icons.filter_alt_outlined,
                  size: 30,
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ],
        backgroundColor: Color.fromARGB(
          255,
          99,
          66,
          191,
        ),
        toolbarHeight: 80,
      ),
      body: BodyMainMenu(),
    );
  }
}
