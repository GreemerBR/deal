import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/database.dart';

class ProfileSummaryInformations extends StatefulHookConsumerWidget {

  ProfileSummaryInformations({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ProfileSummaryInformations> createState() =>
      _ProfileSummaryInformationsState();
}

class _ProfileSummaryInformationsState
    extends ConsumerState<ProfileSummaryInformations> {

  late Future<List<Map<String, dynamic>>> list;
  final user = FirebaseAuth.instance.currentUser!;
    
  @override
  Widget build(BuildContext context) {
  
    return FutureBuilder(
      future: DatabaseApp.instance.select(
        tableName: 'Users',
        columnNames: [
          'UserNomeCompleto',
          'UserCidade',
          'UserEstado',
          'UserImage',
        ],
        condition: 'UserEmail = "${user.email!}"',
      ),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 99, 66, 191),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.memory(
                    snapshot.data![0]['UserImage'],
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    snapshot.data!.isEmpty
                        ? 'Usuário'
                        : snapshot.data![0]["UserNomeCompleto"],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 30,
                  ),
                  child: Text(
                    snapshot.data!.isEmpty
                        ? 'Cidade não Informada - Estado não Informado'
                        : '${snapshot.data![0]["UserCidade"] == null ? 'Cidade não informada' : snapshot.data![0]["UserCidade"]} -' +
                            ' ${snapshot.data![0]["UserEstado"] == null ? 'Estado não informado' : snapshot.data![0]["UserEstado"]}',
                    style: TextStyle(
                      color: Color.fromARGB(255, 196, 196, 196),
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
