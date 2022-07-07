import 'package:flutter/material.dart';

import 'widgets/body_main_menu.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Container(
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
                style: TextStyle(fontSize: 17),
              ),
              Icon(
                Icons.search,
              )
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.favorite_border,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.filter_alt_outlined,
                size: 30,
              ),
              SizedBox(
                width: 30,
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
