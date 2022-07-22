import '../../../core/database.dart';
import 'package:flutter/material.dart';

import '../../active_announces/active_announces_page.dart';
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
  final database = DatabaseApp();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  String dropdownValueSelected = 'Escolha uma opção';

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
                "Móveis",
                "Roupas",
                "Peças",
                "Eletrodomésticos"
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
                database.insert(
                  tableName: 'Announces',
                  columnNames: [
                    'UserID',
                    'AnunTitulo',
                    'AnunDescri',
                    'AnunValor',
                    'AnunCat',
                    // 'AnunCEP',
                    // 'AnunEndereco',
                    'AnunData',
                  ],
                  columnValues: [
                    1,
                    titleController.text.trim(),
                    descriptionController.text.trim(),
                    priceController.text.trim(),
                    dropdownValueSelected,
                    'getdate()'
                  ],
                );

                var result =
                    database.select(tableName: 'Announces', isJoin: false);

                result.then(
                  (List<Map<String, dynamic>> list) {
                    print(list);

                    database.closeDatabase();

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ActiveAnnouncesPage();
                        },
                      ),
                    );
                  },
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
