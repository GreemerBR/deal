import 'package:sqflite/sqflite.dart';

class DatabaseApp {
  late Database database;
  DatabaseApp() {
    init();
  }

  void init() async {
    var databasesPath = await getDatabasesPath();
    String path = '${databasesPath}demo.db';

    await deleteDatabase(path);

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute('PRAGMA foreign_keys = ON');

        await db.execute(
          '''CREATE TABLE Users (
              UserID INTEGER PRIMARY KEY AUTOINCREMENT, 
              UserNomeCompleto TEXT NOT NULL, 
              UserEmail TEXT NOT NULL, 
              UserSenha TEXT NOT NULL, 
              UserApelido TEXT, 
              UserCPF TEXT, 
              UserTelefone TEXT, 
              UserCep TEXT, 
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
            AnunCEF TEXT, 
            AnunEndereco TEXT, 
            AnunData DATE, 
            FOREIGN KEY (UserID) REFERENCES Users (UserID)
            );
            ''',
        );

        await db.execute(
          '''CREATE TABLE FavoriteAnnouces ( 
            FavId INTEGER PRIMARY KEY AUTOINCREMENT, 
            UserID INTEGER NOT NULL, 
            AnunID INTEGER NOT NULL,
            FOREIGN KEY (UserID) REFERENCES Users (UserID),
            FOREIGN KEY (UserID) REFERENCES Announces (AnunID)
            );
            '''
        );
      },
    );
  }

  void insert({
    required String tableName,
    List<String>? columnNames,
    required List<dynamic> columnValues,
  }) async {
    String query = 'INSERT INTO $tableName ';

    for (int index = 0; index < (columnNames?.length ?? 0); index++) {
      if (index == 0) {
        query += '(';
      }
      query += "'${columnNames![index]}', ";
      if (index == columnNames.length - 1) {
        query = query.substring(0, query.length - 2);
        query += ')';
      }
    }

    query += ' VALUES ';

    for (int index = 0; index < columnValues.length; index++) {
      if (index == 0) {
        query += '(';
      }
      query += "'${columnValues[index]}', ";
      if (index == columnValues.length - 1) {
        query = query.substring(0, query.length - 2);
        query += ')';
      }
    }

    await database.rawInsert(query);
  }

  void update({
    required String tableName,
    required List<String> columnNames,
    required List<dynamic> columnValues,
    required String condition,
  }) async {
    String query = 'UPDATE $tableName SET ';

    for (int index = 0; index < columnNames.length; index++) {
      query += '${columnNames[index]} = ?, ';

      if (index == columnNames.length - 1) {
        query = query.substring(0, query.length - 2);
      }
    }
    query += ' WHERE $condition';
    print(query);

    await database.rawUpdate(
      query,
      columnValues,
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

    List<Map<String, dynamic>> list = await database.rawQuery(query);
    return list;
  }

  void delete({
    required String tableName,
    required String condition,
  }) async {
    await database.rawDelete(
      'DELETE FROM $tableName WHERE $condition',
    );
  }

  void closeDatabase() async {
    await database.close();
  }
}
