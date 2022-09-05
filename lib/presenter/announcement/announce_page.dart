import 'package:app_2/core/models/announce_model.dart';
import 'package:app_2/core/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/body_announcement.dart';

// ignore: must_be_immutable
class AnnoucementPage extends StatefulWidget {
  AnnoucementPage({
    Key? key,
    this.isFavorite = false,
    required this.product,
    required this.userRelatedToAd,
  }) : super(key: key);

  bool isFavorite;
  AnnounceModel product;
  UserModel userRelatedToAd;
  @override
  State<AnnoucementPage> createState() => _AnnoucementPageState();
}

class _AnnoucementPageState extends State<AnnoucementPage> {
  void makeFavorite() {
    setState(() {
      widget.isFavorite = !widget.isFavorite;
    });
  }

  void launchWhatsApp() async {
    try {
      await launch(
        'https://api.whatsapp.com/send?phone=5545991318552&text=Ol%C3%A1%2C%20eu%20vi%20seu%20an%C3%BAncio%20no%20Deal.%20Podemos%20conversar%3F',
      );
    } catch (e) {
      print('Erro ao enviar mensagem.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          "Informações",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 99, 66, 191),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                makeFavorite();
              },
              icon: Icon(
                widget.isFavorite
                    ? Icons.favorite_outlined
                    : Icons.favorite_outline_sharp,
                color: (widget.isFavorite ? Colors.white : Colors.grey),
              ),
              splashRadius: 1,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: BodyAnnouncement(
          product: widget.product,
          userRelatedToAd: widget.userRelatedToAd,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 99, 66, 191),
        onPressed: () async {
          launchWhatsApp();
        },
        child: const Icon(
          Icons.whatsapp,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
