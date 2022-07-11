import 'package:flutter/material.dart';

import '../../widgets/profile_summary_informations.dart';
import 'profile_list_informations.dart';

class BodyMyProfileEditor extends StatelessWidget {
  const BodyMyProfileEditor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ProfileSummaryInformations(
                name: 'Gregory Viegas Zimmer',
                address: 'Blumenau - SC',
                photo: 'assets/images/Avatar.jpeg',
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 70,
                  bottom: 80,
                ),
                child: Transform.rotate(
                  angle: 0.15,
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ProfileListInformation(
                    initialText: 'Gregory Viegas Zimmer',
                    boxLabel: 'Nome completo',
                  ),
                  ProfileListInformation(
                    initialText: '',
                    boxLabel: 'Apelido',
                  ),
                  ProfileListInformation(
                    initialText: '',
                    boxLabel: 'CPF/CNPJ',
                  ),
                  ProfileListInformation(
                    initialText: 'gregory.v.zimmer@gmail.com',
                    boxLabel: 'Email',
                  ),
                  ProfileListInformation(
                    initialText: '(47) 9 9188-5219',
                    boxLabel: 'Telefone',
                  ),
                  ProfileListInformation(
                    initialText: '89012-360',
                    boxLabel: 'CEP',
                  ),
                  ProfileListInformation(
                    initialText: 'Guido Kaestner Sênior',
                    boxLabel: 'Rua',
                  ),
                  ProfileListInformation(
                    initialText: 'n° 186',
                    boxLabel: 'Número',
                  ),
                  ProfileListInformation(
                    initialText: '',
                    boxLabel: 'Complemento',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
