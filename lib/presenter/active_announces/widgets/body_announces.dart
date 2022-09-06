import 'package:app_2/core/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../core/app_assets.dart';
import '../../categories/widgets/card_product_ad.dart';
import 'button_new_announce.dart';

class BodyAnnounces extends HookConsumerWidget {
  const BodyAnnounces({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userAnnounces = ref.watch(userStateNotifierProvider)!.announces;
    print(userAnnounces);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      // alignment: Alignment.bottomCenter,
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height - 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: userAnnounces.isEmpty,
                replacement: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: userAnnounces.length,
                    itemBuilder: (context, index) {
                      return CardProductAd(
                        productInformation: userAnnounces[index],
                        imageLink: userAnnounces[index].anunImage,
                        isFavorite: false,
                      );
                    },
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      child: Lottie.asset(
                        notFoundAnimation,
                        reverse: true,
                        height: 250,
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      "Você não tem anúncios ativos",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 196, 196, 196),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Bora emprestar?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 196, 196, 196),
                      ),
                    ),
                  ],
                ),
              ),
              ButtonNewAnnounce(),
            ],
          ),
        ),
      ),
    );
  }
}
