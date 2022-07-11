import 'package:flutter/material.dart';

import '../favorites/favorites_page.dart';
import '../filter/filter_page.dart';
import 'widgets/body_main_menu.dart';

class MainMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        leading: SizedBox(),
        leadingWidth: 0,
        title: TextField(
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: 'O que você está procurando?',
            hintStyle: TextStyle(color: Colors.white, fontSize: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 2.0),
            ),
            filled: true,
            fillColor: Color.fromARGB(255, 192, 180, 225),
            focusColor: Color.fromARGB(255, 192, 180, 225),
            suffixIcon: Icon(
              Icons.search,
              color: Colors.white,
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
                      builder: (context) => FavoritesPage(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.star_border,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FilterPage(),
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
        backgroundColor: Color.fromARGB(255, 99, 66, 191),
        toolbarHeight: 80,
      ),
      body: BodyMainMenu(),
    );
  }
}
