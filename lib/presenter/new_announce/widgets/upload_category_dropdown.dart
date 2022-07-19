import 'package:flutter/material.dart';

class UploadCategoryDropdown extends StatefulWidget {
  final String title;
  final List<String> option;

  const UploadCategoryDropdown({
    Key? key,
    required this.title,
    required this.option,
  }) : super(key: key);

  @override
  State<UploadCategoryDropdown> createState() => _UploadCategoryDropdownState();
}

class _UploadCategoryDropdownState extends State<UploadCategoryDropdown> {
  String dropdownvalue = 'Selecione...';

  var items = ['Selecione...'];

  void initState() {
    super.initState();
    items.addAll(widget.option);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 3),
            padding: EdgeInsets.symmetric(horizontal: 13),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(15),
            ),
            child: DropdownButton(
              underline: SizedBox(),
              iconEnabledColor: Color.fromARGB(255, 99, 66, 191),
              isExpanded: true,
              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(
                  () {
                    dropdownvalue = newValue!;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
