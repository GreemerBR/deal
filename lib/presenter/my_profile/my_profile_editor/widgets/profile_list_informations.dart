import 'package:flutter/material.dart';

class ProfileListInformation extends StatelessWidget {
  final String initialText;
  final String boxLabel;
  final TextEditingController? controller;
  final bool enabled;

   ProfileListInformation({
    super.key,
    required this.initialText,
    required this.boxLabel,
    this.enabled = true,
    this.controller,
  }) {
    controller!.text = initialText;
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: enabled ? Colors.white : Colors.grey.shade300,
          border: Border(
            top: BorderSide(color: Color.fromARGB(255, 196, 196, 196)),
            bottom: BorderSide(color: Color.fromARGB(255, 196, 196, 196)),
            left: BorderSide(color: Color.fromARGB(255, 196, 196, 196)),
            right: BorderSide(color: Color.fromARGB(255, 196, 196, 196)),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: TextField(
            enabled: enabled,
            controller: controller,
            style: TextStyle(
              color: enabled ? Colors.black : Colors.grey.shade500,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: boxLabel,
              labelStyle: TextStyle(
                color: Colors.grey,
              ),

            ),
          ),
        ),
      ),
    );
  }
}
