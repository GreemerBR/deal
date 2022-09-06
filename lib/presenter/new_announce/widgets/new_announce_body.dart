
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'bottom_announce_button.dart';
import 'image_upload_container.dart';
import 'upload_category_dropdown.dart';
import 'upload_text_option.dart';

  final announceImageProvider = StateProvider<Uint8List?>( (ref) => Uint8List(0) );

class NewAnnounceBody extends StatefulHookConsumerWidget {
  NewAnnounceBody({Key? key}) : super(key: key);


  @override
  ConsumerState<NewAnnounceBody> createState() => _NewAnnounceBodyState();

}
  class _NewAnnounceBodyState extends ConsumerState<NewAnnounceBody> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  
  var id;

  void getId() async {
    Response responseId;
    var dioId = Dio();
    responseId =
        await dioId.get('http://zuplae.vps-kinghost.net:8082/api/user/email/${user.email}');
    id = responseId;
  }

  int dropdownValueSelected = 1;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
   final announceImage = ref.watch(announceImageProvider.state);
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
                {'name': 'Brinquedos', 'value': 1},
                {'name': 'Cozinha', 'value': 2},
                {'name': 'Eletrônicos', 'value': 3},
                {'name': 'Esportes', 'value': 4},
                {'name': 'Lazer', 'value': 5},
                {'name': 'Moda', 'value': 6},
                {'name': 'Jardim', 'value': 7},
                {'name': 'Outros', 'value': 8}
              ],
              dropdownValue: dropdownValueSelected,
              onChanged: (Object? value) {
                dropdownValueSelected = int.parse(value.toString());
                setState(() {});
                print(dropdownValueSelected);
              },
            ),
            SizedBox(
              height: 20,
            ),
            BottomAnnounceButton(func: () async {
              getId();
              DateTime atualDate = new DateTime.now();
              var formatter = new DateFormat('dd-MM-yyyy');
              String formattedDate = formatter.format(atualDate);
              Map<String, dynamic> headers = {
                "accept": 'Application/json',
              };

              Map<String, dynamic> body = {
                'anunTitulo': titleController.text,
                'anunDescri': descriptionController.text,
                'anunData': formattedDate,
                'anunValor': double.parse(priceController.text),
                'anunImage': base64Encode(announceImage.state!),
                'categoriesId': 1,
                'userId': 2
              };

              Response response;
              Dio dio = Dio();

              response = await dio.post(
                "http://zuplae.vps-kinghost.net:8082/api/announce",
                data: body,
                options: Options(headers: headers),
              );
              print(
                response.data.toString(),
              );
            }),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
