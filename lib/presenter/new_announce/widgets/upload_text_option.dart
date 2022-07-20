import 'package:flutter/material.dart';

class UploadTextOption extends StatelessWidget {

  final String title;
  final String hint;

  const UploadTextOption({
    Key? key,
    required this.title,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(
            height: 68,
            child: TextFormField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                helperText: hint,
                filled: true,
                fillColor: Colors.grey.shade300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
