import 'package:flutter/material.dart';

import 'widgets/profile_list_informations.dart';
import 'widgets/profile_summary_informations.dart';

class ProfileEditor extends StatefulWidget {
  const ProfileEditor({Key? key}) : super(key: key);

  @override
  State<ProfileEditor> createState() => _ProfileEditorState();
}

class _ProfileEditorState extends State<ProfileEditor> {
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
            'Editar',
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
      ),
    );
  }
}
