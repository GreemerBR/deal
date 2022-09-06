import '../../categories/categories_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../categories/categories_page.dart';

class CategoriesCards extends HookConsumerWidget {
  final String title;
  final IconData icon;

  const CategoriesCards({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const color = Color.fromARGB(255, 192, 180, 225);
    const textColor = Color.fromARGB(255, 153, 152, 152);
    return InkWell(
      onTap: () {
        ref.read(titleStateProvider.state).state = title;

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoriesPage();
            },
          ),
        );
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Icon(
                icon,
                size: 32,
                color: Colors.white,
              ),
            ],
          ),
          Text(
            title,
            style: TextStyle(
              color: textColor,
            ),
          )
        ],
      ),
    );
  }
}
