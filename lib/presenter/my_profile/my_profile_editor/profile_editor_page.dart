import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/app_assets.dart';
import '../../../core/database.dart';
import '../../../core/get_it.dart';
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

  final database = getIt.get<DatabaseApp>();
  final user = FirebaseAuth.instance.currentUser!;

  var photo;
  String tempPhoto = imgAvatar;
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        photo = imageTemp;
      });
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
                  database.update(
                    tableName: 'Users',
                    columnNames: [
                      'UserNomeCompleto',
                      'UserApelido',
                      'UserCPF',
                      'UserCep',
                      'UserTelefone',
                      'UserCidade',
                      'UserEstado',
                      'UserRua',
                      'UserNumero',
                      'UserComplemento'
                    ],
                    columnValues: [
                      '"${nameController.text.trim()}"',
                      '"${apelidoController.text.trim()}"',
                      '"${cpfController.text.trim()}"',
                      '"${cepController.text.trim()}"',
                      '"${telefoneController.text.trim()}"',
                      '"${cidadeController.text.trim()}"',
                      '"${estadoController.text.trim()}"',
                      '"${ruaController.text.trim()}"',
                      int.parse(numeroController.text),
                      '"${complementoController.text.trim()}"'
                    ],
                    condition: 'UserEmail = "${user.email!}"',
                  );
                  database.select(tableName: 'Users').then((List<Map<String, dynamic>> value) => print(value));
                  // print(nameController.text);
                  setState(() {});
                },
              ),
            ),
          ]),
      body: FutureBuilder(
        future: database.select(
            tableName: 'Users',
            columnNames: [
              'UserNomeCompleto',
              'UserApelido',
              'UserCPF',
              'UserCep',
              'UserTelefone',
              'UserCidade',
              'UserRua',
              'UserNumero',
              'UserComplemento',
              'UserEstado'
            ],
            condition: 'UserEmail = "${user.email!}"'),
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
                    ProfileSummaryInformations(
                      photo: photo != null ? photo : tempPhoto,
                    ),
                    Container(
                      child: Padding(
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
                          initialText: snapshot.data![0]["UserNomeCompleto"] == null
                              ? ''
                              : snapshot.data![0]["UserNomeCompleto"],
                          boxLabel: 'Nome completo',
                          controller: nameController,
                        ),
                        ProfileListInformation(
                          initialText: snapshot.data![0]["UserApelido"] == null ? '' : snapshot.data![0]["UserApelido"],
                          boxLabel: 'Apelido',
                          controller: apelidoController,
                        ),
                        ProfileListInformation(
                          initialText: snapshot.data![0]["UserCPF"] == null ? '' : snapshot.data![0]["UserCPF"],
                          boxLabel: 'CPF/CNPJ',
                          controller: cpfController,
                        ),
                        ProfileListInformation(
                          initialText:
                              snapshot.data![0]["UserTelefone"] == null ? '' : snapshot.data![0]["UserTelefone"],
                          boxLabel: 'Telefone',
                          controller: telefoneController,
                        ),
                        ProfileListInformation(
                          initialText: snapshot.data![0]["UserCep"] == null ? '' : snapshot.data![0]["UserCep"],
                          boxLabel: 'CEP',
                          controller: cepController,
                        ),
                        ProfileListInformation(
                          initialText: snapshot.data![0]["UserEstado"] == null ? '' : snapshot.data![0]["UserEstado"],
                          boxLabel: 'Estado',
                          controller: estadoController,
                        ),
                        ProfileListInformation(
                          initialText: snapshot.data![0]["UserCidade"] == null ? '' : snapshot.data![0]["UserCidade"],
                          boxLabel: 'Cidade',
                          controller: cidadeController,
                        ),
                        ProfileListInformation(
                          initialText: snapshot.data![0]["UserRua"] == null ? '' : snapshot.data![0]["UserRua"],
                          boxLabel: 'Rua',
                          controller: ruaController,
                        ),
                        ProfileListInformation(
                          initialText:
                              snapshot.data![0]["UserNumero"] == null ? '' : snapshot.data![0]["UserNumero"].toString(),
                          boxLabel: 'Número',
                          controller: numeroController,
                        ),
                        ProfileListInformation(
                          initialText:
                              snapshot.data![0]["UserComplemento"] == null ? '' : snapshot.data![0]["UserComplemento"],
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
