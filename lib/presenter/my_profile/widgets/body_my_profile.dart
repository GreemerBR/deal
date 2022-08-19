import 'package:flutter/material.dart';

import '../../about_deal/about_deal_page.dart';
import '../../active_announces/active_announces_page.dart';
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
          ProfileSummaryInformations(),
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
                    title: 'Buscas recentes',
                  ),
                  ProfileListItem(
                    title: 'Notificações',
                  ),
                  ProfileListItem(
                    title: 'Termos e Política de Privacidade',
                  ),
                  ProfileListItem(
                    title: 'Sobre o DEAL',
                    destinyPage: AboutDealPage(),
                  ),
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
