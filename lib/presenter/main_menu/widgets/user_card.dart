import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/database.dart';
import '../../../core/get_it.dart';
import 'avatar.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = getIt.get<DatabaseApp>();

    final user = FirebaseAuth.instance.currentUser!;
    final nomeUser = database
        .select(tableName: 'Users', columnNames: ['UserNomeCompleto']); //,
    // condition: 'UserEmail = "${user.email!}"');

    print('USERNAME');

    nomeUser.then(
      (List<Map<String, dynamic>> nomeUsuario) {
        print(nomeUsuario[0]["UserNomeCompleto"]);
      },
    );

    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Avatar(),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Olá,",
              style: TextStyle(
                color: Color.fromARGB(255, 153, 152, 152),
                fontSize: 16,
              ),
            ),
            Text(
              'Teeste',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
