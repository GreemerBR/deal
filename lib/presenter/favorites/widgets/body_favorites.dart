import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/general_providers.dart';

class BodyFavorites extends HookConsumerWidget {
  const BodyFavorites({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStateNotifierProvider);
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: user!.favoriteAnnounces.length,
      itemBuilder: (context, index) {
        return SizedBox.shrink();
        // return CardProductAd(
        //   productInformation: user.favoriteAnnounces[index],
        //   imageLink: user.favoriteAnnounces[index].anunImage,
        //   isFavorite: true,
        // );
      },
    );
  }
}
