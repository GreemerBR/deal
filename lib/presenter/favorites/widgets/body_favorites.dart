import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../core/app_assets.dart';
import '../../../core/general_providers.dart';
import '../../categories/widgets/card_product_ad.dart';

class BodyFavorites extends HookConsumerWidget {
  const BodyFavorites({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStateNotifierProvider)!.favoriteAnnounces;
    return SizedBox.shrink();
    // return Visibility(
    //   visible: userFavoriteAnnounces.isEmpty,
    //   replacement: SizedBox(
    //     height: MediaQuery.of(context).size.height * 0.5,
    //     width: MediaQuery.of(context).size.width,
    //     child:
    //     //  ListView.builder(
    //     //   itemCount: userFavoriteAnnounces.length,
    //     //   itemBuilder: (context, index) {
    //     //     return SizedBox.shrink();
    //     //     // return CardProductAd(
    //     //     //   productInformation: userFavoriteAnnounces[index].announce,
    //     //     //   imageLink: userFavoriteAnnounces[index].announce.anunImage,
    //     //     //   isFavorite: false,
    //     //     // );
    //     //   },
    //     // ),
    //   ),
    //   child: Column(
    //     children: [
    //       Container(
    //         child: Lottie.asset(
    //           notFoundAnimation,
    //           reverse: true,
    //           height: 250,
    //         ),
    //       ),
    //       SizedBox(height: 50),
    //       Text(
    //         "Você não tem anúncios ativos",
    //         style: TextStyle(
    //           fontSize: 25,
    //           color: Color.fromARGB(255, 196, 196, 196),
    //         ),
    //       ),
    //       SizedBox(height: 10),
    //       Text(
    //         "Bora emprestar?",
    //         style: TextStyle(
    //           fontSize: 16,
    //           color: Color.fromARGB(255, 196, 196, 196),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
