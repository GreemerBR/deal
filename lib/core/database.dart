import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseApp extends StatefulWidget {
  const DatabaseApp({Key? key}) : super(key: key);

  @override
  State<DatabaseApp> createState() => _DatabaseAppState();
}

class _DatabaseAppState extends State<DatabaseApp> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    // Passa a localização para o android e iOS para criar o banco no path
    var databasesPath = await getDatabasesPath();
    String path = '${databasesPath}/demo.db';

    // Método para deletar a database
    // await deleteDatabase(path);

    // Método para abrir a database
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE Usuarios (UserId INT PRIMARY KEY AUTO_INCREMENT, UserNomeCompleto VARCHAR(50) NOT NULL, UserEmail VARCHAR(50) NOT NULL, UserSenha VARCHAR(50) NOT NULL, UserApelido VARCHAR(50), UserCPF VARCHAR(14), UserTelefone VARCHAR(20), UserCep VARCHAR(20), UserRua VARCHAR(20), UserNumero INT, UserComplemento VARCHAR(50));');

        await db.execute(
            'CREATE TABLE Anuncios ( AnunId INT PRIMARY KEY AUTO_INCREMENT, UserId INT REFERENCES Usuario (UserId), AnunTitulo VARCHAR(50) NOT NULL, AnunDescri VARCHAR(150) NOT NULL, AnunCat VARCHAR(20), AnunCEF VARCHAR(18), AnunEndereco VARCHAR(20), AnunData DATE, AnunValor DOUBLE);');

        await db.execute(
            'CREATE TABLE AnunciosFavoritos ( FavId INT PRIMARY KEY AUTO_INCREMENT, UserId INT REFERENCES Usuario (UserId), AnunId INT REFERENCES Anuncios (AnunId));');
      },
    );

    // Insert some records in a transaction
    await database.transaction(
      (txn) async {
        int id1 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)',
        );
        print('inserted1: $id1');
        int id2 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
          ['another name', 12345678, 3.1416],
        );
        print('inserted2: $id2');
      },
    );

    // Update some record
    int count = await database.rawUpdate(
      'UPDATE Test SET name = ?, value = ? WHERE name = ?',
      ['updated name', '9876', 'some name'],
    );
    print('updated: $count');

    // Get the records
    List<Map> list = await database.rawQuery('SELECT * FROM Test');
    List<Map> expectedList = [
      {'name': 'updated name', 'id': 1, 'value': 9876, 'num': 456.789},
      {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
    ];

    // Delete a record
    count = await database.rawDelete(
      'DELETE FROM Test WHERE name = ?',
      ['another name'],
    );

    // Close the database
    await database.close();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
