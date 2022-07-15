import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';
import '../../active_announces/active_announces_page.dart';
import '../../login/login_page.dart';
import 'close_button_profile.dart';
import 'profile_list_item.dart';
import 'profile_summary_informations.dart';

class BodyMyProfile extends StatelessWidget {
  const BodyMyProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ProfileSummaryInformations(
            name: 'Gregory Viegas Zimmer',
            address: 'Blumenau - SC',
            photo: imgAvatar,
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
    );
  }
}
