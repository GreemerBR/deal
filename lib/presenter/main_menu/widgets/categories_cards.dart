import 'package:flutter/material.dart';

class CategoriesCards extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget destinyPage;

  const CategoriesCards({Key? key, required this.title, required this.icon, required this.destinyPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Color.fromARGB(255, 192, 180, 225);
    const textColor = Color.fromARGB(255, 153, 152, 152);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return destinyPage;
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
