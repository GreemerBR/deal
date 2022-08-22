import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../is_logged/is_logged_page.dart';

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
        height: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        width: double.maxFinite,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45),
            ),
            padding: EdgeInsets.only(
              top: 15,
              bottom: 15,
              left: 75,
              right: 75,
            ),
            backgroundColor: Color.fromARGB(255, 99, 66, 191),
            primary: Colors.white,
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: () {
            FirebaseAuth.instance.currentUser!.email;
            FirebaseAuth.instance.signOut();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return IsLoggedPage();
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
      ),
    );
  }
}
