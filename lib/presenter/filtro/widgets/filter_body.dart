import 'package:flutter/material.dart';

import 'fake_button_container.dart';
import 'filter_option_container.dart';

class FilterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 99, 66, 191),
        toolbarHeight: 80,
        title: Center(
          child: Text(
            "Filtro",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Column(
              children: [
                FilterOptionContainer(title: "Categoria", option: "Categoria / Subcategoria",),
                FilterOptionContainer(title: "Localização", option: "Santa Catarina",),
                FilterOptionContainer(title: "Cidade / Zona", option: "Blumenau",),
                FilterOptionContainer(title: "Ordenar Por:", option: "Relevância",),
                FakeButtonContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
