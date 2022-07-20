import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SlideComponent extends StatelessWidget {
  final dynamic listCarousel;
  const SlideComponent({Key? key, required this.listCarousel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider.builder(
        options: CarouselOptions(),
        itemCount: (listCarousel.length / 2).round(),
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
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        listCarousel[idx],
                        height: 200,
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
