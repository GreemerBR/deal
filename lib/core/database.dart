import 'app_assets.dart';
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
    final List<ByteData> airFryer = [
      await rootBundle.load(imgAirFryer1),
      await rootBundle.load(imgAirFryer2),
      await rootBundle.load(imgAirFryer3),
    ];

    final List<ByteData> bancoImobiliario = [
      await rootBundle.load(imgBancoImobiliario1),
      await rootBundle.load(imgBancoImobiliario2),
      await rootBundle.load(imgBancoImobiliario3),
    ];

    final ByteData bytesImgAvatar = await rootBundle.load(imgAvatar);

    final List<ByteData> lawnMower = [
      await rootBundle.load(imgLawnMower1),
      await rootBundle.load(imgLawnMower2),
      await rootBundle.load(imgLawnMower3),
    ];

    final List<ByteData> popCornMaker = [
      await rootBundle.load(imgPopcornMaker1),
      await rootBundle.load(imgPopcornMaker2),
      await rootBundle.load(imgPopcornMaker3),
    ];

    final List<ByteData> sewingMachine = [
      await rootBundle.load(imgSewingMachine1),
      await rootBundle.load(imgSewingMachine2),
      await rootBundle.load(imgSewingMachine3),
    ];

    final List<ByteData> pS5 = [
      await rootBundle.load(imgPs51),
      await rootBundle.load(imgPs52),
      await rootBundle.load(imgPs53),
    ];

    final List<ByteData> tenisFutsal = [
      await rootBundle.load(imgTenisFustal1),
      await rootBundle.load(imgTenisFustal2),
      await rootBundle.load(imgTenisFustal3),
    ];

    await deleteDatabase(path);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('PRAGMA foreign_keys = ON');

        await db.execute(
          '''CREATE TABLE users (
              userID INTEGER PRIMARY KEY AUTOINCREMENT, 
              userNomeCompleto TEXT NOT NULL, 
              userEmail TEXT NOT NULL, 
              userSenha TEXT NOT NULL, 
              userImage BLOB,
              userApelido TEXT, 
              userCpf TEXT, 
              userTelefone TEXT, 
              userCep TEXT, 
              userCidade TEXT,
              userEstado TEXT,
              userRua TEXT, 
              userNumero INTEGER, 
              userComplemento TEXT
              );''',
        );

        await db.execute(
          '''CREATE TABLE Announces ( 
            anunID INTEGER PRIMARY KEY AUTOINCREMENT, 
            userID INTEGER NOT NULL,
            anunTitulo TEXT NOT NULL, 
            anunDescri TEXT NOT NULL, 
            anunValor REAL NOT NULL,
            anunImage1 BLOB NOT NULL,
            anunImage2 BLOB NOT NULL,
            anunImage3 BLOB NOT NULL,
            anunCat TEXT NOT NULL, 
            anunCep TEXT NOT NULL, 
            anunEndereco TEXT NOT NULL, 
            anunData TEXT NOT NULL, 
            FOREIGN KEY (userID) REFERENCES users (userID)
            );
            ''',
        );

        await db.execute('''CREATE TABLE FavoriteAnnouces ( 
            FavId INTEGER PRIMARY KEY AUTOINCREMENT, 
            userID INTEGER NOT NULL, 
            anunID INTEGER NOT NULL,
            FOREIGN KEY (userID) REFERENCES users (userID),
            FOREIGN KEY (userID) REFERENCES Announces (anunID)
            );
            ''');

        await db.insert('users', {
          'userID': null,
          'userNomeCompleto': 'Admin',
          'userEmail': 'adm@gmail.com',
          'userSenha': 'adm123',
          'userImage': bytesImgAvatar.buffer.asUint8List(),
          'userApelido': 'Administrador',
          'userCpf': '932.182.345-81',
          'userTelefone': '58981293847',
          'userCep': '89010-204',
          'userCidade': 'Blumenau',
          'userEstado': 'Santa Catarina',
          'userRua': 'R. 7 de Setembro',
          'userNumero': 24,
          'userComplemento': 'Tarumã Office'
        });

        await db.insert('Announces', {
          'anunID': null,
          'userID': 1,
          'anunTitulo': 'Air Fryer',
          'anunDescri': 'Air fryer pouco usada, em ótimo estado',
          'anunValor': 30.00,
          'anunImage1': airFryer[0].buffer.asUint8List(),
          'anunImage2': airFryer[1].buffer.asUint8List(),
          'anunImage3': airFryer[2].buffer.asUint8List(),
          'anunCat': 'Cozinha',
          'anunCep': '89012360',
          'anunEndereco': 'Rua Guido Kaester Sênior, 186',
          'anunData': '22/08/2022',
        });

        await db.insert('Announces', {
          'anunID': null,
          'userID': 1,
          'anunTitulo': 'Banco imobiliário',
          'anunDescri': 'Um jogo muito divertido para você e toda sua família',
          'anunValor': 20.00,
          'anunImage1': bancoImobiliario[0].buffer.asUint8List(),
          'anunImage2': bancoImobiliario[1].buffer.asUint8List(),
          'anunImage3': bancoImobiliario[2].buffer.asUint8List(),
          'anunCat': 'Brinquedos',
          'anunCep': '89062370',
          'anunEndereco': 'Rua Helena Fischer, 248',
          'anunData': '22/08/2022',
        });

        await db.insert('Announces', {
          'anunID': null,
          'userID': 1,
          'anunTitulo': 'Pipoqueira',
          'anunDescri': '''Pipoqueira Household Kitchen Máquina de pipoca doce,
          máquina automática de fazer pipoca''',
          'anunValor': 50.00,
          'anunImage1': popCornMaker[0].buffer.asUint8List(),
          'anunImage2': popCornMaker[1].buffer.asUint8List(),
          'anunImage3': popCornMaker[2].buffer.asUint8List(),
          'anunCat': 'Lazer',
          'anunCep': '89138000',
          'anunEndereco': 'Rua Ribeirão São Paulo, 1661',
          'anunData': '15/08/2022',
        });

        await db.insert('Announces', {
          'anunID': null,
          'userID': 1,
          'anunTitulo': 'Máquina de Costura Singer Doméstica Facilita Pro 4411',
          'anunDescri': '''Sofisticada Máquina de Costura Facilita Pro 4411 da 
Singer! A Facilita Pro 4411 foi feita para quem precisa de rapidez e precisão
nas suas costuras''',
          'anunValor': 150.00,
          'anunImage1': sewingMachine[0].buffer.asUint8List(),
          'anunImage2': sewingMachine[1].buffer.asUint8List(),
          'anunImage3': sewingMachine[2].buffer.asUint8List(),
          'anunCat': 'Eletrônicos',
          'anunCep': '89138000',
          'anunEndereco': 'Rua Ribeirão São Paulo, 1661',
          'anunData': '15/08/2022',
        });

        await db.insert('Announces', {
          'anunID': null,
          'userID': 1,
          'anunTitulo': 'PS5',
          'anunDescri': '''PS5 com leitor de cartão, em oótimo estado, como
novo. Acompanha 2 controles e conta logada com 35
jogos na bibliotaca. Principais títulos do mercado.
Não abaixo o preço, favor não insistir.''',
          'anunValor': 200.00,
          'anunImage1': pS5[0].buffer.asUint8List(),
          'anunImage2': pS5[1].buffer.asUint8List(),
          'anunImage3': pS5[2].buffer.asUint8List(),
          'anunCat': 'Eletrônicos',
          'anunCep': '89036410',
          'anunEndereco': 'Rua Jacob Schmitt, 86',
          'anunData': '21/08/2022',
        });

        await db.insert('Announces', {
          'anunID': null,
          'userID': 1,
          'anunTitulo': 'Cortador de Grama Trapp com Recolhedor',
          'anunDescri': 'Aparelho semi-novo, em ótimas condições',
          'anunValor': 90.00,
          'anunImage1': lawnMower[0].buffer.asUint8List(),
          'anunImage2': lawnMower[1].buffer.asUint8List(),
          'anunImage3': lawnMower[2].buffer.asUint8List(),
          'anunCat': 'Jardim',
          'anunCep': '89050501',
          'anunEndereco': 'Rua Antônio Cardoso, 387',
          'anunData': '16/08/2022',
        });

        await db.insert('Announces', {
          'anunID': null,
          'userID': 1,
          'anunTitulo': 'Tênis de Futsal',
          'anunDescri': '''Bom tênies, muito macia e com boa aderência.
Você vai se sentir como um carro de formula 1, voando''',
          'anunValor': '55.70',
          'anunImage1': tenisFutsal[0].buffer.asUint8List(),
          'anunImage2': tenisFutsal[1].buffer.asUint8List(),
          'anunImage3': tenisFutsal[2].buffer.asUint8List(),
          'anunCat': 'Esportes',
          'anunCep': '89031004',
          'anunEndereco': 'Rua Gustavo Salinger, 120',
          'anunData': '17/08/2022',
        });
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
    String query = 'SELECT ${(columnNames?.join(', ') ?? "*")} FROM $tableName ';

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
