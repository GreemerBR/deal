import 'package:flutter/material.dart';

import 'fake_button_container.dart';
import 'filter_option_container.dart';
import 'price_range_slider.dart';

class BodyFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 99, 66, 191),
        toolbarHeight: 80,
        title: Center(
          child: Text(
            "Filtro",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  FilterOptionContainer(
                    title: "Categoria",
                    option: ["Móveis", "Roupas", "Peças", "Carros"],
                  ),
                  FilterOptionContainer(
                    title: "Localização",
                    option: ["SC", "PR", "RS", "SP"],
                  ),
                  FilterOptionContainer(
                    title: "Cidade",
                    option: [
                      "Blumenau",
                      "Gaspar",
                      "Ilhota",
                      "Indaial",
                      "Curitiba",
                      "Porto Alegre",
                      "São Paulo"
                    ],
                  ),
                  FilterOptionContainer(
                    title: "Ordenar Por:",
                    option: [
                      "Relevância",
                      "Valor",
                    ],
                  ),
                  SizedBox(height: 25),
                  PriceRangeSlider(),
                  SizedBox(height: 25),
                  FakeButtonContainer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
