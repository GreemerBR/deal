import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarrouselImagensInfo extends StatelessWidget {
  final dynamic listCarousel;
  const CarrouselImagensInfo({Key? key, required this.listCarousel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      color: Colors.black,
      child: CarouselSlider.builder(
        options: CarouselOptions(),
        itemCount: (listCarousel.length / 3).round(),
        itemBuilder: (context, index, realIdx) {
          final int first = index * 2;
          final int second = first + 1;
          return Row(
            children: [first, second].map(
              (idx) {
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        listCarousel[idx],
                        height: 500,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}
