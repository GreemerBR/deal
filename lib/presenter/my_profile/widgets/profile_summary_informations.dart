import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/database.dart';


class ProfileSummaryInformations extends StatefulWidget {
  final photo;
  ProfileSummaryInformations({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  State<ProfileSummaryInformations> createState() =>
      _ProfileSummaryInformationsState();
}

class _ProfileSummaryInformationsState
    extends State<ProfileSummaryInformations> {

  late Future<List<Map<String, dynamic>>> list;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
    setInformation();
  }

  Future<void> setInformation() async {
    list = DatabaseApp.instance.select(
      tableName: 'Users',
      columnNames: ['UserNomeCompleto', 'UserCidade', 'UserEstado'],
      condition: 'UserEmail = "${user.email!}"',
    );
    setState(() {});
  }

// Image.memory(photo!)
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: list,
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
                widget.photo.runtimeType == String
                    ? Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.photo),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(300),
                        ),
                      )
                    : Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(widget.photo),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(300),
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
