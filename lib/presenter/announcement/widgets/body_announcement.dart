

import 'dart:convert';

import 'package:app_2/core/models/announce_model.dart';
import 'package:flutter/material.dart';

import '../../../core/models/user_model.dart';


class BodyAnnouncement extends StatelessWidget {
  const BodyAnnouncement({
    Key? key,
    required this.product,
    required this.userRelatedToAd
  }) : super(key: key);

  final AnnounceModel product;
  final UserModel userRelatedToAd;
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Image.memory(
              base64Decode(product.anunImage),
            ),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              'R\$ ${product.anunValor.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 40,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 5),
                            child: Text(
                              product.anunTitulo,
                              style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 196, 196, 196),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 5),
                            child: Text(
                              '${userRelatedToAd.userRua}, ${userRelatedToAd.userNumero} - ${product.anunData}',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 196, 196, 196),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                product.anunDescri,
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
