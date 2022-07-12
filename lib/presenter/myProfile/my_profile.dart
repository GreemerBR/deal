import 'package:flutter/material.dart';

import '../activeAnnounces/active_announces.dart';
import '../login/login.dart';
import 'profile_editor.dart';
import 'widgets/close_button_profile.dart';
import 'widgets/profile_list_item.dart';
import 'widgets/profile_summary_informations.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 99, 66, 191),
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Minha Conta',
            style: TextStyle(fontSize: 30),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfileEditor();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.edit_note,
                size: 35,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ProfileSummaryInformations(
              name: 'Gregory Viegas Zimmer',
              address: 'Blumenau - SC',
              photo: 'assets/images/Avatar.jpeg',
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ProfileListItem(
                      title: 'Meus anúncios',
                      destinyPage: ActiveAnnounces(),
                    ),
                    ProfileListItem(
                      title: 'Buscar recentes',
                      destinyPage: Login(),
                    ),
                    ProfileListItem(
                      title: 'Notificações',
                      destinyPage: Login(),
                    ),
                    ProfileListItem(
                      title: 'Segurança e privacidade',
                      destinyPage: Login(),
                    ),
                    ProfileListItem(
                      title: 'Sobre o DEAL',
                      destinyPage: Login(),
                    )
                  ],
                ),
              ),
            ),
            CloseButtonProfile(),
          ],
        ),
      ),
    );
  }
}
