
import 'package:flutter/material.dart';
import '../../favorites/favorites_page.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Color.fromARGB(255, 153, 152, 152);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.favorite_border,
              size: 28,
            ),
            color: color,
            onPressed: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return FavoritesPage();
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
