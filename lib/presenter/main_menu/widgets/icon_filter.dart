import 'package:flutter/material.dart';

class FilterIcon extends StatelessWidget {
  const FilterIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Color.fromARGB(255, 153, 152, 152);
    return Container(
      //decoration: BoxDecoration(color: Colors.purple),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            Icons.filter_alt_outlined,
            color: color,
          )
        ],
      ),
    );
  }
}
