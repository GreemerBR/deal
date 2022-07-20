import 'package:app_2/presenter/main_menu/main_menu_page.dart';
import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';
import '../../categories/categories_page.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoriesPage();
            },
          ),
        );
      },
      icon: Image.asset(
        imgLoginGoogle,
        fit: BoxFit.cover,
      ),
      iconSize: 150,
    );
  }
}
