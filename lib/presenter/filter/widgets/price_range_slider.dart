import 'package:flutter/material.dart';

class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({Key? key}) : super(key: key);

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  RangeValues currentRangeValue = const RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Selecione uma faixa de preço:",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        RangeSlider(
          values: currentRangeValue,
          min: 0,
          max: 500,
          divisions: 10,
          labels: RangeLabels(
            currentRangeValue.start.round().toString(),
            currentRangeValue.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              currentRangeValue = values;
            });
          },
        ),
      ],
    );
  }
}
