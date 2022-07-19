import 'package:app_2/presenter/login/login_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_assets.dart';
import '../../../new_announce/widgets/image_upload_container.dart';
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
                photo: imgAvatar,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 70,
                  bottom: 80,
                ),
                child: Transform.rotate(
                  angle: 0.15,
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ImageUploadContainer()
                                // ver -> modal bottom sheet flutter
                                ;
                          },
                        ),
                      );
                    },
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
                    initialText: '',
                    boxLabel: 'Email',
                  ),
                  ProfileListInformation(
                    initialText: '',
                    boxLabel: 'Telefone',
                  ),
                  ProfileListInformation(
                    initialText: '',
                    boxLabel: 'CEP',
                  ),
                  ProfileListInformation(
                    initialText: '',
                    boxLabel: 'Rua',
                  ),
                  ProfileListInformation(
                    initialText: '',
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
