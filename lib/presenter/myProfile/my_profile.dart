import 'package:app_2/presenter/active_announces/active_announces_page.dart';
import 'package:app_2/presenter/login/login_page.dart';
import 'package:app_2/presenter/my_profile/my_profile_editor/profile_editor_page.dart';
import 'package:app_2/presenter/my_profile/widgets/close_button_profile.dart';
import 'package:flutter/material.dart';

import '../my_profile/widgets/profile_list_item.dart';
import '../my_profile/widgets/profile_summary_informations.dart';


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
                      return ProfileEditorPage();
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
                      destinyPage: ActiveAnnouncesPage(),
                    ),
                    ProfileListItem(
                      title: 'Buscar recentes',
                      destinyPage: LoginPage(),
                    ),
                    ProfileListItem(
                      title: 'Notificações',
                      destinyPage: LoginPage(),
                    ),
                    ProfileListItem(
                      title: 'Segurança e privacidade',
                      destinyPage: LoginPage(),
                    ),
                    ProfileListItem(
                      title: 'Sobre o DEAL',
                      destinyPage: LoginPage(),
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
