import '../../../core/app_assets.dart';
import '../../../core/get_it.dart';
import 'card_product_ad.dart';
import 'package:flutter/material.dart';

import '../../../core/database.dart';

// ignore: must_be_immutable
class BodyCategories extends StatelessWidget {
  final String title;

  BodyCategories({required this.title});

  DatabaseApp database = getIt.get<DatabaseApp>();


  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: database.select(
        tableName: 'Announces',
        condition: 'AnunCat = "$title"',
      ),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Map<String, dynamic>>? list = snapshot.data;
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: list!.length,
          itemBuilder: (context, index) {
            return CardProductAd(
              productInformation: list[index],
              imageLink: imgBen10,
            );
          },
        );
      },
    );
  }
}
