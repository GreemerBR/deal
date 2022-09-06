
import 'package:app_2/core/general_providers.dart';
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
    final user = ref.watch(userStateNotifierProvider);

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: list.announces.length,
      itemBuilder: (context, index) {
        for (int i = 0; i < user!.favoriteAnnounces.length; i++) {
          if (user.favoriteAnnounces[i].announceId ==
              list.announces[index].id) {
            return CardProductAd(
              productInformation: list.announces[index],
              imageLink: list.announces[index].anunImage,
              isFavorite: true,
            );
          }
        }
        // print(favorite);

        return CardProductAd(
          productInformation: list.announces[index],
          imageLink: list.announces[index].anunImage,
          isFavorite: false,
        );
      },
    );
  }
}
