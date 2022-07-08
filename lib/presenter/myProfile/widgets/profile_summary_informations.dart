import 'package:flutter/material.dart';

class ProfileSummaryInformations extends StatelessWidget {
  final String name;
  final String address;
  final String photo;
  const ProfileSummaryInformations({
    Key? key,
    required this.name,
    required this.address,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 99, 66, 191),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(photo),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(300),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 50,
              ),
              child: Text(
                address,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
