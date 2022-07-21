import 'package:flutter/material.dart';

import '../../core/database.dart';
import 'widgets/circle_avatar.dart';
import 'widgets/default_link_text.dart';
import 'widgets/default_title.dart';
import 'widgets/login_google.dart';
import 'widgets/login_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);
  final database = DatabaseApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 66, 191),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTitle(
                title: 'Já possui conta?',
                subtitle: 'Entre agora mesmo',
                colortitle: Colors.white,
                colorSubtitle: Colors.white,
              ),
              ProfileAvatar(),
              LoginWidget(),
              GoogleButton(),
              DefaultLinkText(),
              ElevatedButton(
                onPressed: () {
                  database.insert(
                    tableName: 'Users',
                    columnNames: [
                      'UserNomeCompleto',
                      'UserEmail',
                      'UserSenha',
                    ],
                    columnValues: [
                      'Henrique da Silva Cardoso',
                      'riquinho@gmail.com',
                      '123456'
                    ],
                  );
                  database.insert(
                    tableName: 'Users',
                    columnNames: [
                      'UserNomeCompleto',
                      'UserEmail',
                      'UserSenha',
                    ],
                    columnValues: [
                      'Rique da Pimba Caridoso',
                      'riquinho@gmail.com',
                      '123456'
                    ],
                  );
                  database.insert(
                    tableName: 'Announces',
                    columnNames: [
                      'UserID',
                      'AnunTitulo',
                      'AnunDescri',
                      'AnunValor'
                    ],
                    columnValues: [
                      '1',
                      'Frigideira',
                      'Frigideira Limpinha',
                      2.50
                    ],
                  );

                  var result = database.select(
                    tableName: 'Users',
                    columnNames: [
                      'UserNomeCompleto',
                      'AnunTitulo',
                      'AnunValor'
                    ],
                    isJoin: true,
                    joinType: 'INNER JOIN',
                    joinLeftColumnNames: ['UserID'],
                    joinRightTableNames: ['Announces'],
                    joinRightColumnNames: ['UserID'],
                  );

                  result.then((List<Map<String, dynamic>> list) {
                    print(list);
                    database.closeDatabase();
                  });
                },
                child: Text('Clique aqui'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
