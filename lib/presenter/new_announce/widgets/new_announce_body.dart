import 'package:app_2/core/database.dart';
import 'package:flutter/material.dart';

import '../../active_announces/active_announces_page.dart';
import '../../active_announces/widgets/body_announces.dart';
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
            DefaultInput(
              title: "Título *",
              hint: "Exemplo: Batedeira Inox Cadence",
              controller: titleController,
            ),
            DefaultInput(
              title: "Descrição *",
              hint: "Exemplo: Semi Nova, Usada Poucas Vezes ",
              controller: descriptionController,
            ),
            DefaultInput(
              title: "Valor *",
              hint: "Exemplo: 120,00 ",
              controller: priceController,
            ),
            UploadCategoryDropdown(
              title: "Categoria *",
              option: ["Móveis", "Roupas", "Peças", "Eletrodomésticos"],
              controller: categoryController,
            ),
            SizedBox(
              height: 20,
            ),
            BottomAnnounceButton(
              func: () {
                // database.insert(
                //   tableName: 'Announces',
                //   columnNames: [
                //     'UserID',
                //     'AnunTitulo',
                //     'AnunDescri',
                //     'AnunValor',
                //     'AnunCat',
                //     // 'AnunCEP',
                //     // 'AnunEndereco',
                //     'AnunData',
                //   ],
                //   columnValues: [
                //     1,
                //     titleController.value,
                //     descriptionController.text.trim(),
                //     priceController.text.trim(),
                //     categoryController.text.trim(),
                //     'getdate()'
                //   ],
                // );

                // var result =
                //     database.select(tableName: 'Announces', isJoin: false);

                // result.then(
                //   (List<Map<String, dynamic>> list) {
                //     print(list);

                // database.closeDatabase();

                print(titleController.value);
                print(descriptionController.text.trim());
                print(priceController.text.trim());
                print(categoryController.text.trim());

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ActiveAnnouncesPage();
                    },
                  ),
                );
                // },
                // );
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
