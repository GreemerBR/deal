import 'package:flutter/material.dart';

import '../../../core/database.dart';
import '../../my_profile/my_profile_page.dart';

class Avatar extends StatefulWidget {
  Avatar({
    Key? key,
  }) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DatabaseApp.instance.select(
        tableName: 'Users',
      ),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        // print('Esse é o valor: ${snapshot.data}');
        if (!snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: CircularProgressIndicator(),
          );
        }
        return MaterialButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return MyProfilePage();
                },
              ),
            );
          },
          child: ClipOval(
            child: Image.memory(
              snapshot.data![0]['UserImage'],
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
