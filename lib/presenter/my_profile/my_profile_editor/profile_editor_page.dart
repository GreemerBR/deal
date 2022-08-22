import 'dart:io';
import 'dart:typed_data';

import 'package:app_2/presenter/my_profile/my_profile_editor/widgets/profile_summary_informations_editor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/app_assets.dart';
import '../../../core/database.dart';

import '../widgets/profile_summary_informations.dart';
import 'widgets/profile_list_informations.dart';

class ProfileEditorPage extends StatefulWidget {
  const ProfileEditorPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditorPage> createState() => _ProfileEditorPageState();
}

class _ProfileEditorPageState extends State<ProfileEditorPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController apelidoController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController estadoController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController ruaController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController complementoController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser!;

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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Icon(
                  Icons.save,
                ),
                onPressed: () {
                  DatabaseApp.instance.update(
                    table: 'Users',
                    valuesAndNames: {
                      'UserNomeCompleto': nameController.text.trim(),
                      'UserApelido': apelidoController.text.trim(),
                      'UserCPF': cpfController.text.trim(),
                      'UserCep': cepController.text.trim(),
                      'UserTelefone': telefoneController.text.trim(),
                      'UserImage' : photo,
                      // 'UserCidade',
                      'UserRua': ruaController.text.trim(),
                      'UserNumero': int.parse(numeroController.text),
                      'UserComplemento': complementoController.text.trim()
                      // 'UserEstado'
                    },
                    condition: 'UserEmail = ?',
                    conditionValues: [user.email],
                  );
                  Navigator.of(context).pop();
                  setState(() {});
                },
              ),
            ),
          ]),
      body: FutureBuilder(
        future: DatabaseApp.instance.select(
          tableName: 'Users',
          columnNames: [
            'UserNomeCompleto',
            'UserApelido',
            'UserCPF',
            'UserImage',
            'UserCep',
            'UserTelefone',
            'UserCidade',
            'UserRua',
            'UserNumero',
            'UserComplemento',
            'UserEstado'
          ],
          condition: 'UserEmail = "${user.email!}"',
        ),
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
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
                          initialText:
                              snapshot.data![0]["UserNomeCompleto"] == null
                                  ? ''
                                  : snapshot.data![0]["UserNomeCompleto"],
                          boxLabel: 'Nome completo',
                          controller: nameController,
                        ),
                        ProfileListInformation(
                          initialText: snapshot.data![0]["UserApelido"] == null
                              ? ''
                              : snapshot.data![0]["UserApelido"],
                          boxLabel: 'Apelido',
                          controller: apelidoController,
                        ),
                        ProfileListInformation(
                          initialText: snapshot.data![0]["UserCPF"] == null
                              ? ''
                              : snapshot.data![0]["UserCPF"],
                          boxLabel: 'CPF/CNPJ',
                          controller: cpfController,
                        ),
                        ProfileListInformation(
                          initialText: snapshot.data![0]["UserTelefone"] == null
                              ? ''
                              : snapshot.data![0]["UserTelefone"],
                          boxLabel: 'Telefone',
                          controller: telefoneController,
                        ),
                        ProfileListInformation(
                          initialText: snapshot.data![0]["UserCep"] == null
                              ? ''
                              : snapshot.data![0]["UserCep"],
                          boxLabel: 'CEP',
                          controller: cepController,
                        ),
                        ProfileListInformation(
                          initialText: snapshot.data![0]["UserEstado"] == null
                              ? ''
                              : snapshot.data![0]["UserEstado"],
                          boxLabel: 'Estado',
                          controller: estadoController,
                        ),
                        ProfileListInformation(
                          initialText: snapshot.data![0]["UserCidade"] == null
                              ? ''
                              : snapshot.data![0]["UserCidade"],
                          boxLabel: 'Cidade',
                          controller: cidadeController,
                        ),
                        ProfileListInformation(
                          initialText: snapshot.data![0]["UserRua"] == null
                              ? ''
                              : snapshot.data![0]["UserRua"],
                          boxLabel: 'Rua',
                          controller: ruaController,
                        ),
                        ProfileListInformation(
                          initialText: snapshot.data![0]["UserNumero"] == null
                              ? ''
                              : snapshot.data![0]["UserNumero"].toString(),
                          boxLabel: 'Número',
                          controller: numeroController,
                        ),
                        ProfileListInformation(
                          initialText:
                              snapshot.data![0]["UserComplemento"] == null
                                  ? ''
                                  : snapshot.data![0]["UserComplemento"],
                          boxLabel: 'Complemento',
                          controller: complementoController,
                        ),
                      ],
                    ),
                  ),
                ),
                // SaveButtonProfile(),
              ],
            ),
          );
        },
      ),
    );
  }
}
