import 'package:flutter/material.dart';

class FilterOptionContainer extends StatelessWidget {
  final String title;
  final String option;
  
  const FilterOptionContainer({
    Key? key,
    required this.title,
    required this.option,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 196, 196, 196),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                option,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ],
    );
  }
}
