import 'package:app_2/presenter/mainMenu/main_menu.dart';
import 'package:flutter/material.dart';

class FakeButtonContainer extends StatelessWidget {
  const FakeButtonContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          minWidth: 250,
          height: 85,
          color: Color.fromARGB(255, 99, 66, 191),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return MainMenu();
                },
              ),
            );
          },
          child: Text(
            "Filtrar",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),

        // Container(
        //   width: double.maxFinite,
        //   height: 100,
        //   margin: EdgeInsets.only(
        //     top: 30,
        //     right: 20,
        //     left: 20,
        //   ),
        //   decoration: BoxDecoration(
        //       color: Color.fromARGB(255, 99, 66, 191),
        //       borderRadius: BorderRadius.circular(15)),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text(
        //         "Filtrar",
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 25,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
