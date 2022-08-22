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
            AnunImage1 BLOB,
            AnunImage2 BLOB,
            AnunImage3 BLOB,
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
          'UserImage': bytesImgAvatar.buffer.asUint8List(),
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

        await db.insert('Announces', {
          'AnunID': null,
          'UserID': 1,
          'AnunTitulo': 'Air Fryer',
          'AnunDescri': 'Air fryer pouco usada, em ótimo estado',
          'AnunValor': '30.00',
          'AnunImage1': airFryer[0].buffer.asUint8List(),
          'AnunImage2': airFryer[1].buffer.asUint8List(),
          'AnunImage3': airFryer[2].buffer.asUint8List(),
          'AnunCat': 'Cozinha',
          'AnunCEP': '89012360',
          'AnunEndereco': 'Rua Guido Kaester Sênior, 186',
          'AnunData': '22/08/2022',
        });

        await db.insert('Announces', {
          'AnunID': null,
          'UserID': 1,
          'AnunTitulo': 'Banco imobiliário',
          'AnunDescri': 'Um jogo muito divertido para você e toda sua família',
          'AnunValor': '20.00',
          'AnunImage1': bancoImobiliario[0].buffer.asUint8List(),
          'AnunImage2': bancoImobiliario[1].buffer.asUint8List(),
          'AnunImage3': bancoImobiliario[2].buffer.asUint8List(),
          'AnunCat': 'Brinquedos',
          'AnunCEP': '89062370',
          'AnunEndereco': 'Rua Helena Fischer, 248',
          'AnunData': '22/08/2022',
        });

        await db.insert('Announces', {
          'AnunID': null,
          'UserID': 1,
          'AnunTitulo': 'Pipoqueira',
          'AnunDescri': '''Pipoqueira Household Kitchen Máquina de pipoca doce,
          máquina automática de fazer pipoca''',
          'AnunValor': '50.00',
          'AnunImage1': popCornMaker[0].buffer.asUint8List(),
          'AnunImage2': popCornMaker[1].buffer.asUint8List(),
          'AnunImage3': popCornMaker[2].buffer.asUint8List(),
          'AnunCat': 'Lazer',
          'AnunCEP': '89138000',
          'AnunEndereco': 'Rua Ribeirão São Paulo, 1661',
          'AnunData': '15/08/2022',
        });

        await db.insert('Announces', {
          'AnunID': null,
          'UserID': 1,
          'AnunTitulo': 'Máquina de Costura Singer Doméstica Facilita Pro 4411',
          'AnunDescri': '''Sofisticada Máquina de Costura Facilita Pro 4411 da 
Singer! A Facilita Pro 4411 foi feita para quem precisa de rapidez e precisão
nas suas costuras''',
          'AnunValor': '150.00',
          'AnunImage1': sewingMachine[0].buffer.asUint8List(),
          'AnunImage2': sewingMachine[1].buffer.asUint8List(),
          'AnunImage3': sewingMachine[2].buffer.asUint8List(),
          'AnunCat': 'Eletrônicos',
          'AnunCEP': '89138000',
          'AnunEndereco': 'Rua Ribeirão São Paulo, 1661',
          'AnunData': '15/08/2022',
        });

        await db.insert('Announces', {
          'AnunID': null,
          'UserID': 1,
          'AnunTitulo': 'PS5',
          'AnunDescri': '''PS5 com leitor de cartão, em oótimo estado, como
novo. Acompanha 2 controles e conta logada com 35
jogos na bibliotaca. Principais títulos do mercado.
Não abaixo o preço, favor não insistir.''',
          'AnunValor': '200.00',
          'AnunImage1': pS5[0].buffer.asUint8List(),
          'AnunImage2': pS5[1].buffer.asUint8List(),
          'AnunImage3': pS5[2].buffer.asUint8List(),
          'AnunCat': 'Eletrônicos',
          'AnunCEP': '89036410',
          'AnunEndereco': 'Rua Jacob Schmitt, 86',
          'AnunData': '21/08/2022',
        });

        await db.insert('Announces', {
          'AnunID': null,
          'UserID': 1,
          'AnunTitulo': 'Cortador de Grama Trapp com Recolhedor',
          'AnunDescri': 'Aparelho semi-novo, em ótimas condições',
          'AnunValor': '90.00',
          'AnunImage1': lawnMower[0].buffer.asUint8List(),
          'AnunImage2': lawnMower[1].buffer.asUint8List(),
          'AnunImage3': lawnMower[2].buffer.asUint8List(),
          'AnunCat': 'Jardim',
          'AnunCEP': '89050501',
          'AnunEndereco': 'Rua Antônio Cardoso, 387',
          'AnunData': '16/08/2022',
        });

        await db.insert('Announces', {
          'AnunID': null,
          'UserID': 1,
          'AnunTitulo': 'Tênis de Futsal',
          'AnunDescri': '''Bom tênies, muito macia e com boa aderência.
Você vai se sentir como um carro de formula 1, voando''',
          'AnunValor': '55.70',
          'AnunImage1': tenisFutsal[0].buffer.asUint8List(),
          'AnunImage2': tenisFutsal[1].buffer.asUint8List(),
          'AnunImage3': tenisFutsal[2].buffer.asUint8List(),
          'AnunCat': 'Esportes',
          'AnunCEP': '89031004',
          'AnunEndereco': 'Rua Gustavo Salinger, 120',
          'AnunData': '17/08/2022',
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
