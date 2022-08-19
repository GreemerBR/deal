import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/database.dart';

import '../../main_menu/main_menu_page.dart';

import 'bottom_announce_button.dart';
import 'image_upload_container.dart';
import 'upload_category_dropdown.dart';
import 'upload_text_option.dart';

class NewAnnounceBody extends StatefulWidget {
  const NewAnnounceBody({Key? key}) : super(key: key);

  @override
  State<NewAnnounceBody> createState() => _NewAnnounceBodyState();
}

class _NewAnnounceBodyState extends State<NewAnnounceBody> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  String dropdownValueSelected = 'Escolha uma opção';
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 99, 66, 191),
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          "Inserir Anúncio",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ImageUploadContainer(),
            UploadTextOption(
              title: "Título *",
              hint: "Exemplo: Batedeira Inox Cadence",
              controller: titleController,
            ),
            UploadTextOption(
              title: "Descrição *",
              hint: "Exemplo: Semi Nova, Usada Poucas Vezes ",
              controller: descriptionController,
            ),
            UploadTextOption(
              title: "Valor *",
              hint: "Exemplo: 120,00 ",
              controller: priceController,
            ),
            UploadCategoryDropdown(
              title: "Categoria *",
              options: [
                "Escolha uma opção",
                "Brinquedos",
                "Cozinha",
                "Eletrônicos",
                "Esportes",
                "Lazer",
                "Moda",
                "Jardim",
                "Outros"
              ],
              dropdownValue: dropdownValueSelected,
              onChanged: (String? value) {
                dropdownValueSelected = value!;
                setState(() {});
              },
            ),
            SizedBox(
              height: 20,
            ),
            BottomAnnounceButton(
              func: () {
                DatabaseApp.instance.insert(
                  tableName: 'Announces',
                  valuesAndNames: {
                    'UserID': 1,
                    'AnunTitulo': titleController.text.trim(),
                    'AnunDescri': descriptionController.text.trim(),
                    'AnunValor': priceController.text.trim(),
                    'AnunCat': dropdownValueSelected,
                    // 'AnunCEP':
                    // 'AnunEndereco':
                    'AnunData': DateFormat.yMd().format(DateTime.now())
                  },
                );
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return MainMenuPage();
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
