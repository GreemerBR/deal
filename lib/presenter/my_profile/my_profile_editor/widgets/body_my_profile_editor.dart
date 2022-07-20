import 'dart:io';
import 'dart:typed_data';

import '../../../../core/app_assets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'save_button_profile.dart';
import '../../widgets/profile_summary_informations.dart';
import 'profile_list_informations.dart';

class BodyMyProfileEditor extends StatefulWidget {
  const BodyMyProfileEditor({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyMyProfileEditor> createState() => _BodyMyProfileEditorState();
}

class _BodyMyProfileEditorState extends State<BodyMyProfileEditor> {
  Uint8List? photo;
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
        photo = imageTemp.readAsBytesSync();
      });
    } catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: $e');
    }
  }

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
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Wrap(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(25),
                                  child: DottedBorder(
                                    dashPattern: [4, 7],
                                    color: Colors.grey.shade700,
                                    radius: Radius.circular(15),
                                    child: MaterialButton(
                                      onPressed: () {
                                        pickImage();
                                      },
                                      child: Container(
                                        height: 200,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.upload,
                                              size: 55,
                                              color: Color.fromARGB(
                                                  255, 99, 66, 191),
                                            ),
                                            Text(
                                              "Inserir Foto...",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 99, 66, 191),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        );
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
          ),
          SaveButtonProfile(),
        ],
      ),
    );
  }
}
