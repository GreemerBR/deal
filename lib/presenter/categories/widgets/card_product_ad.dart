import 'dart:convert';

import 'package:app_2/core/general_providers.dart';
import 'package:app_2/core/models/announce_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/models/user_model.dart';
import '../../announcement/announce_page.dart';

// ignore: must_be_immutable
class CardProductAd extends StatefulHookConsumerWidget {
  CardProductAd({
    Key? key,
    required this.productInformation,
    required this.imageLink,
    this.isFavorite = false,
  }) : super(key: key);
  final AnnounceModel productInformation;
  Future<UserModel>? userRelatedToAd;
  final String imageLink;
  bool isFavorite;
  @override
  ConsumerState<CardProductAd> createState() => _CardProductAdState();
}

class _CardProductAdState extends ConsumerState<CardProductAd> {
  void makeFavorite() async {
    if (!widget.isFavorite) {
      await Dio().post(
        'http://zuplae.vps-kinghost.net:8082/api/favoriteannounce/',
        data: {
          "userId": await ref.watch(userStateNotifierProvider)!.id,
          "announceId": widget.productInformation.id
        },  
      );
    } else {
      await Dio().delete(
        'http://zuplae.vps-kinghost.net:8082/api/favoriteannounce/delete',
        queryParameters: {
          "userId": ref.watch(userStateNotifierProvider)!.id,
          "announceId": widget.productInformation.id
        }
      );
    }
    widget.isFavorite = !widget.isFavorite;
    setState(
      () {},
    );
  }

  Future<UserModel> getUserFromAd() async {
    var result = await Dio().get(
      'http://zuplae.vps-kinghost.net:8082/api/user/${widget.productInformation.userId}',
    );

    return UserModel.fromMap(result.data);
  }

  @override
  void initState() {
    super.initState();
  
  }

  @override
  Widget build(BuildContext context) {
    widget.userRelatedToAd = getUserFromAd();
    return FutureBuilder(
      future: widget.userRelatedToAd,
      builder: (context, AsyncSnapshot<UserModel> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return MaterialButton(
          onPressed: () {
            try {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return AnnoucementPage(
                      product: widget.productInformation,
                      userRelatedToAd: snapshot.data!,
                    );
                  },
                ),
              );
            } catch (e) {
              print(e);
            }
          },
          child: Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: 190,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: MemoryImage(
                            base64Decode(widget.imageLink),
                          ),
                          fit: BoxFit.fitHeight,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        border: Border.all(
                          width: 0.5,
                          color: Color.fromARGB(255, 192, 180, 225),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        makeFavorite();
                      },
                      icon: Icon(
                        widget.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: (widget.isFavorite
                            ? Color.fromARGB(255, 99, 66, 191)
                            : Colors.grey),
                      ),
                      splashRadius: 1,
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productInformation.anunTitulo,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            'R\$ ${widget.productInformation.anunValor.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Text(
                          '${snapshot.data!.userRua}, ${snapshot.data!.userNumero}',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
