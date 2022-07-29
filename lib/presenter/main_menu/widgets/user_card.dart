import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/database.dart';
import '../../../core/get_it.dart';
import 'avatar.dart';

class UserCard extends StatelessWidget {
  UserCard({Key? key}) : super(key: key);

  final database = getIt.get<DatabaseApp>();
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: database.select(
          tableName: 'Users',
          columnNames: ['UserNomeCompleto'],
          condition: 'UserEmail = "${user.email!}"'),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
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
                  snapshot.data!.isEmpty
                      ? 'Usuário'
                      : snapshot.data![0]["UserNomeCompleto"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
