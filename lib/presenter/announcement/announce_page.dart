import 'package:app_2/core/models/announce_model.dart';
import 'package:app_2/core/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/body_announcement.dart';

// ignore: must_be_immutable
class AnnoucementPage extends StatefulHookConsumerWidget {
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
  ConsumerState<AnnoucementPage> createState() => _AnnoucementPageState();
}

final favoriteStateProvider = StateProvider(
  (ref) {
    return false;
  },
);

class _AnnoucementPageState extends ConsumerState<AnnoucementPage> {
  void launchWhatsApp() async {
    try {
      await launch(
        'https://api.whatsapp.com/send?phone=55${widget.userRelatedToAd.userTelefone}&text=Ol%C3%A1%2C%20eu%20vi%20seu%20an%C3%BAncio%20no%20Deal.%20Podemos%20conversar%3F',
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return Text('Erro ao enviar a mensagem');
        },
      );
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
                ref.read(favoriteStateProvider.state).state =
                    !ref.read(favoriteStateProvider.state).state;
              },
              icon: Icon(
                ref.watch(favoriteStateProvider.state).state
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
