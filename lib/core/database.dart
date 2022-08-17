
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

        await db.execute(
          """INSERT INTO Users VALUES (
          NULL, 
          'Admin', 
          'adm@gmail.com', 
          'adm123', 
          NULL,
          'Riquinho', 
          '93218234581', 
          '58981293847', 
          '37289123', 
          'Blumenau',
          'Santa Catarina',
          'Rua da tristeza e depressão', 
          24, 
          'Casa'
          )
          """,
        );
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

  void insert({
    required String tableName,
    required Map<String, Object?> valuesAndNames,
  }) {
    database.insert(
      tableName,
      valuesAndNames,
    );
  }

  void update(
      {required String table,
      required Map<String, Object?> valuesAndNames,
      required String condition,
      required List<Object?> conditionValues}) {
    database.update(
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
