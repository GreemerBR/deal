import '../my_profile_page.dart';
import 'package:flutter/material.dart';

class CloseButtonProfile extends StatelessWidget {
  const CloseButtonProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Container(
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color.fromARGB(255, 196, 196, 196),
            ),
          ),
        ),
        width: double.maxFinite,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(45),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                left: 120,
                right: 120,
                top: 30,
                bottom: 30,
                child: Container(
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                      bottom: Radius.circular(30),
                    ),
                    color: Color.fromARGB(255, 63, 81, 181),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                    left: 75,
                    right: 75,
                  ),
                  backgroundColor: Color.fromARGB(255, 63, 81, 181),
                  primary: Color.fromARGB(255, 196, 196, 196),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return MyProfilePage();
                      },
                    ),
                  );
                },
                child: const Text(
                  'SAIR',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
