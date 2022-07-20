import 'package:app_2/presenter/main_menu/widgets/slide_component.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/app_assets.dart';

class BodyAnnouncement extends StatelessWidget {
  const BodyAnnouncement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: SlideComponent(
              listCarousel: imageList,
            ),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 20),
                          child: Text(
                            'R\$ 10',
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: Text(
                            'NOME DO PRODUTO',
                            style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 196, 196, 196),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: Text(
                            'BAIRRO - DATA E HORA POSTAGEM ANÚNCIO',
                            style: TextStyle(
                              fontSize: 10,
                              color: Color.fromARGB(255, 196, 196, 196),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 20),
                            child: Text(
                              'Descrição',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              top: 5,
                              right: 25,
                            ),
                            child: Text(
                              'AASJFOIAHNDGÇLDPFALMASLDKAJSBFLADKFLAHSLFMSFKDFBAKLKASDBALJKSFJLÇAMFMABFKAFNKJASFA,SLDSKNFALS,FALSJFÇKASF',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 196, 196, 196),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
