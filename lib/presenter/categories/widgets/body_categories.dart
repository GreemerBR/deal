import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/notifiers/categories_notifier.dart';
import 'card_product_ad.dart';

// ignore: must_be_immutable
class BodyCategories extends HookConsumerWidget {
  final String title;

  BodyCategories({required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(categoriesStateNotifierProvider);

    // print(list.announces[4]);
 
   
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: list.announces.length,
      itemBuilder: (context, index) {
        return CardProductAd(
          productInformation: list.announces[index],
          imageLink: list.announces[index].anunImage,
        );
      },
    );
  }
}
