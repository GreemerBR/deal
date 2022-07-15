import 'package:flutter/cupertino.dart';

import '../../../core/app_assets.dart';
import 'carrousel_imagens_info.dart';

class BodyAnnouncement extends StatelessWidget {
  const BodyAnnouncement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      CarrouselImagensInfo(
        listCarousel: imageList,
      ),
      Container(
        child: Column(
          children: [
            Row(),
            Row(),
          ],
        ),
      ),
    ]));
  }
}
