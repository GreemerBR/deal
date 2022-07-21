import 'package:flutter/cupertino.dart';

import '../../../core/app_assets.dart';
import 'slide_component_announces.dart';


class BodyAnnouncement extends StatelessWidget {
  const BodyAnnouncement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: SlideComponentAnnounces(
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
                          padding: const EdgeInsets.only(left: 15),
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
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 75),
                              child: Text(
                                'UMA DESCRIÇÃO MUITO LOUCA AQUI PRA TENTAR EMPRESTAR ESSE NEGOCIO',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 196, 196, 196),
                                  overflow: TextOverflow.clip,
                                ),
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
