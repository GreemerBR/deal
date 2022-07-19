import 'package:flutter/material.dart';

import 'bottom_announce_button.dart';
import 'image_upload_container.dart';
import 'upload_category_dropdown.dart';
import 'upload_text_option.dart';

class NewAnnounceBody extends StatelessWidget {

  const NewAnnounceBody({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 99, 66, 191),
        toolbarHeight: 80,
        title: Center(
          child: Text(
            "Inserir Anúncio",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ImageUploadContainer(),
            UploadTextOption(title: "Título *", hint: "Exemplo: Batedeira Inox Cadence"),
            UploadTextOption(title: "Descrição *", hint: "Exemplo: Semi Nova, Usada Poucas Vezes "),
            UploadCategoryDropdown(title: "Categoria *", option: ["Móveis","Roupas","Peças","Eletrodomésticos"]),
            UploadTextOption(title: "CEP *", hint: "Exemplo: 00000-000"),
            SizedBox(height: 20,),
            BottomAnnounceButton(),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}