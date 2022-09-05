import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:app_2/core/general_providers.dart';
import 'package:app_2/presenter/my_profile/my_profile_editor/widgets/profile_summary_informations_editor.dart';
import 'package:app_2/presenter/my_profile/my_profile_page.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';


import 'widgets/profile_list_informations.dart';

final photoProvider = StateProvider((ref) {
  return "teste ";
});

class ProfileEditorPage extends StatefulHookConsumerWidget {
  const ProfileEditorPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileEditorPage> createState() => _ProfileEditorPageState();
}

class _ProfileEditorPageState extends ConsumerState<ProfileEditorPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController apelidoController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController estadoController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController ruaController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController complementoController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser!;

  late var userInfo = ref.watch(userStateNotifierProvider)!;

  Uint8List callImage() {
    return base64Decode(userInfo.userImage);
  }

  Uint8List? photo;
  File? image;

  Future<void> pickImage() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 50);
      if (image == null) return;
      File fileImage = File(image.path);
      photo = fileImage.readAsBytesSync();
      setState(() {});
    } catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: $e');
    }
  }

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
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MyProfilePage();
                },
              ),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(
                Icons.save,
              ),
              onPressed: () async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                await Dio().put(
                  "http://zuplae.vps-kinghost.net:8082/api/user",
                  data: {
                    "userNomeCompleto": userInfo.userNomeCompleto,
                    "userEmail": userInfo.userEmail,
                    "userSenha": userInfo.userSenha,
                    "userApelido": apelidoController.text,
                    "userCpf": cpfController.text,
                    "userTelefone": telefoneController.text,
                    "userCep": cepController.text,
                    "userEstado": estadoController.text,
                    "userCidade": cidadeController.text,
                    "userBairro": bairroController.text,
                    "userRua": ruaController.text,
                    "userComplemento": complementoController.text,
                    "userNumero": numeroController.text,
                    "userImage": base64Encode(photo ?? callImage()),
                    "id": userInfo.id,
                  },
                );

                await ref.watch(userStateNotifierProvider.notifier).getUser();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return MyProfilePage();
                  },
                ));
                setState(() {});
                
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ProfileSummaryInformationsEditor(image: photo),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 90,
                        bottom: 45,
                      ),
                      child: Transform.rotate(
                        angle: 0,
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.grey,
                            size: 25,
                          ),
                          onPressed: () {
                            pickImage();
                          },
                        ),
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
                        enabled: false,
                        initialText: userInfo.userNomeCompleto,
                        boxLabel: 'Nome completo',
                        controller: nameController,
                      ),
                      ProfileListInformation(
                        initialText: userInfo.userApelido,
                        boxLabel: 'Apelido',
                        controller: apelidoController,
                      ),
                      ProfileListInformation(
                        initialText: userInfo.userCpf,
                        boxLabel: 'Cpf/CNPJ',
                        controller: cpfController,
                      ),
                      ProfileListInformation(
                        initialText: userInfo.userTelefone,
                        boxLabel: 'Telefone',
                        controller: telefoneController,
                      ),
                      ProfileListInformation(
                        initialText: userInfo.userCep,
                        boxLabel: 'CEP',
                        controller: cepController,
                      ),
                      ProfileListInformation(
                        initialText:
                            userInfo.userEstado == 'Estado não informado'
                                ? ''
                                : userInfo.userEstado,
                        boxLabel: 'Estado',
                        controller: estadoController,
                      ),
                      ProfileListInformation(
                        initialText:
                            userInfo.userCidade == 'Cidade não informada'
                                ? ''
                                : userInfo.userCidade,
                        boxLabel: 'Cidade',
                        controller: cidadeController,
                      ),
                      ProfileListInformation(
                        initialText: userInfo.userBairro,
                        boxLabel: 'Bairro',
                        controller: bairroController,
                      ),
                      ProfileListInformation(
                        initialText: userInfo.userRua,
                        boxLabel: 'Rua',
                        controller: ruaController,
                      ),
                      ProfileListInformation(
                        initialText: userInfo.userNumero == 0
                            ? ''
                            : userInfo.userNumero.toString(),
                        boxLabel: 'Número',
                        controller: numeroController,
                      ),
                      ProfileListInformation(
                        initialText: userInfo.userComplemento,
                        boxLabel: 'Complemento',
                        controller: complementoController,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
