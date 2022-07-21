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
        options: CarouselOptions(viewportFraction: 1.0),
        itemCount: listCarousel.length,
        itemBuilder: (context, index, realIdx) {
          return Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      listCarousel[index],
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
