import 'package:sqflite/sqflite.dart';

import 'save_ayat_model.dart';

class SaveAyatLocal {
  final String _tableName = 'ayat';
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      'ayat.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName (
            nomorSurat INTEGER PRIMARY KEY,
            namaSurat TEXT,
            nomorAyat INTEGER
          )
        ''');
      },
    );
  }

  Future<String> insertAyatLastRead(SaveAyatModel data) async {
    final db = await database;
    await db.insert(
      _tableName,
      data.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return 'Success insert ayat last read';
  }

  Future<SaveAyatModel> getAyatLastRead() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    if (maps.isNotEmpty) {
      return SaveAyatModel.fromMap(maps.first);
    } else {
      throw 'Data last read not found';
    }
  }

  Future<String> deleteAyatLastRead() async {
    final db = await database;
    await db.delete(_tableName);
    return 'Success delete ayat last read';
  }

  Future<String> updateAyatLastRead(SaveAyatModel data) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    if (maps.isNotEmpty) {
      await db.update(
        _tableName,
        data.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return 'Success update ayat last read';
    } else {
      insertAyatLastRead(data);
      return 'Success insert ayat last read';
    }
  }
}
