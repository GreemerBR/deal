import 'package:flutter/material.dart';

import '../../login/login_page.dart';

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
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey),
          ),
        ),
        height: 100,
        width: double.maxFinite,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                left: 120,
                right: 120,
                top: 30,
                bottom: 30,
                child: Container(
                  // width: double.maxFinite,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                      bottom: Radius.circular(30),
                    ),
                    // color: Color.fromARGB(255, 63, 81, 181),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.only(
                    top: 25,
                    bottom: 25,
                    left: 50,
                    right: 50,
                  ),
                  backgroundColor: Color.fromARGB(255, 63, 81, 181),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                    ),
                  );
                },
                child: const Text(
                  'SAIR',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
