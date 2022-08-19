import 'package:app_2/core/app_assets.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseApp {
  static final DatabaseApp instance = DatabaseApp._init();
  static Database? _database;

  DatabaseApp._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = '${databasesPath}demo.db';
    final ByteData bytes = await rootBundle.load(imgAvatar);

    await deleteDatabase(path);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('PRAGMA foreign_keys = ON');

        await db.execute(
          '''CREATE TABLE Users (
              UserID INTEGER PRIMARY KEY AUTOINCREMENT, 
              UserNomeCompleto TEXT NOT NULL, 
              UserEmail TEXT NOT NULL, 
              UserSenha TEXT NOT NULL, 
              UserImage BLOB,
              UserApelido TEXT, 
              UserCPF TEXT, 
              UserTelefone TEXT, 
              UserCep TEXT, 
              UserCidade TEXT,
              UserEstado TEXT,
              UserRua TEXT, 
              UserNumero INTEGER, 
              UserComplemento TEXT
              );''',
        );

        await db.execute(
          '''CREATE TABLE Announces ( 
            AnunID INTEGER PRIMARY KEY AUTOINCREMENT, 
            UserID INTEGER NOT NULL,
            AnunTitulo TEXT NOT NULL, 
            AnunDescri TEXT NOT NULL, 
            AnunValor REAL NOT NULL,
            AnunCat TEXT, 
            AnunCEP TEXT, 
            AnunEndereco TEXT, 
            AnunData TEXT, 
            FOREIGN KEY (UserID) REFERENCES Users (UserID)
            );
            ''',
        );

        await db.execute('''CREATE TABLE FavoriteAnnouces ( 
            FavId INTEGER PRIMARY KEY AUTOINCREMENT, 
            UserID INTEGER NOT NULL, 
            AnunID INTEGER NOT NULL,
            FOREIGN KEY (UserID) REFERENCES Users (UserID),
            FOREIGN KEY (UserID) REFERENCES Announces (AnunID)
            );
            ''');

        await db.insert('Users', {
          'UserID': null,
          'UserNomeCompleto': 'Admin',
          'UserEmail': 'adm@gmail.com',
          'UserSenha': 'adm123',
          'UserImage': bytes.buffer.asUint8List(),
          'UserApelido': 'Administrador',
          'UserCPF': '932.182.345-81',
          'UserTelefone': '58981293847',
          'UserCep': '89010-204',
          'UserCidade': 'Blumenau',
          'UserEstado': 'Santa Catarina',
          'UserRua': 'R. 7 de Setembro',
          'UserNumero': 24,
          'UserComplemento': 'Tarumã Office'
        });

        await db.execute(
          """INSERT INTO Announces
          VALUES
          (NULL, 1, 'DEF', 'DEF', 5.0, 'Eletrônicos','DEF', 'DEF', 'DEF'),
          (NULL, 1, 'DEF', 'DEF', 5.0, 'Eletrônicos','DEF', 'DEF', 'DEF'),
          (NULL, 1, 'DEF', 'DEF', 5.0, 'Eletrônicos','DEF', 'DEF', 'DEF'),
          (NULL, 1, 'DEF', 'DEF', 5.0, 'Eletrônicos','DEF', 'DEF', 'DEF'),
          (NULL, 1, 'DEF', 'DEF', 5.0, 'Eletrônicos','DEF', 'DEF', 'DEF'),
          (NULL, 1, 'GHI', 'GHI', 7.5, 'Cozinha', 'GHI', 'GHI', 'GHI'),
          (NULL, 1, 'GHI', 'GHI', 7.5, 'Cozinha', 'GHI', 'GHI', 'GHI'),
          (NULL, 1, 'ABC', 'ABC', 2.5, 'Brinquedos','ABC', 'ABC', 'ABC'),
          (NULL, 1, 'ABC', 'ABC', 2.5, 'Brinquedos','ABC', 'ABC', 'ABC'),
          (NULL, 1, 'ABC', 'ABC', 2.5, 'Brinquedos','ABC', 'ABC', 'ABC'),
          (NULL, 1, 'ABC', 'ABC', 2.5, 'Brinquedos','ABC', 'ABC', 'ABC')
          """,
        );
      },
    );
  }

  Future insert({
    required String tableName,
    required Map<String, Object?> valuesAndNames,
  }) async {
    final db = await instance.database;

    db.insert(
      tableName,
      valuesAndNames,
    );
  }

  Future update({
    required String table,
    required Map<String, Object?> valuesAndNames,
    required String condition,
    required List<Object?> conditionValues,
  }) async {
    final db = await instance.database;
    await db.update(
      table,
      valuesAndNames,
      where: condition,
      whereArgs: conditionValues,
    );
  }

  Future<List<Map<String, dynamic>>> select({
    List<String>? columnNames,
    required String tableName,
    bool isJoin = false,
    String? joinType,
    List<String>? joinLeftColumnNames,
    List<String>? joinRightTableNames,
    List<String>? joinRightColumnNames,
    String? condition,
  }) async {
    bool assertJoinTrue = (isJoin == true &&
        (joinType != null &&
            joinRightTableNames != null &&
            joinRightColumnNames != null &&
            joinLeftColumnNames != null));
    bool assertJoinFalse = (isJoin == false &&
        (joinType == null &&
            joinRightTableNames == null &&
            joinRightColumnNames == null &&
            joinLeftColumnNames == null));
    assert(assertJoinTrue || assertJoinFalse);

    final db = await instance.database;
    String query =
        'SELECT ${(columnNames?.join(', ') ?? "*")} FROM $tableName ';

    if (isJoin == true) {
      for (int index = 0; index < joinRightTableNames!.length; index++) {
        query += '$joinType ';
        query += '${joinRightTableNames[index]}';
        query += ' ON ';
        query += '${joinRightTableNames[index]}.';
        query += '${joinRightColumnNames![index]}';
        query += ' = ';
        query += '${tableName}.${joinLeftColumnNames![index]}';
      }
    }

    if (condition != null) {
      query += ' WHERE $condition';
    }

    List<Map<String, dynamic>> list = await db.rawQuery(query);
    return list;
  }

  void delete({
    required String tableName,
    required String condition,
  }) async {
    final db = await instance.database;
    await db.rawDelete(
      'DELETE FROM $tableName WHERE $condition',
    );
  }

  void closeDatabase() async {
    final db = await instance.database;
    await db.close();
  }
}
