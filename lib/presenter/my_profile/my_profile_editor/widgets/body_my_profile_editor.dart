import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/app_assets.dart';
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
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ProfileSummaryInformations(
                name: 'Gregory Viegas Zimmer',
                address: 'Blumenau - SC',
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
          // SaveButtonProfile(),
        ],
      ),
    );
  }
}
