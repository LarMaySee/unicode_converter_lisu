import 'dart:async';

import 'package:lisu_font_converter/models/history_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDB {
  MyDB._();

  static final MyDB db = MyDB._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "lisu_font_converter.db");
    return await openDatabase(path, version: 5, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS History (id INTEGER PRIMARY KEY,data TEXT, isUnicode INTEGER,  createdAt TEXT)');
    }, onUpgrade: _onUpgrade);
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {}

// get list
  Future<List<History>> getHistories() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query("History",
        columns: ['id', 'data', 'isUnicode', 'createdAt'], orderBy: "id DESC");
    List<History> histories = results.map((e) => History.fromMap(e)).toList();

    print("histories -- re$histories");

    return histories;
  }

// inseart
  Future<int> insert(History history) async {
    print('history ${history.toMap()}');

    final db = await database;
    var maxIdResult =
        await db.rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM History");

    var id = maxIdResult.first["last_inserted_id"];
    var result = await db.rawInsert(
        "INSERT Into History (id, data, isUnicode, createdAt)"
        " VALUES (?, ?, ?, ?)",
        [id, history.data, history.isUnicode, history.createdAt]);
    return result;
  }

// clear all
  Future<int> deleteAll() async {
    final db = await database;
    var res = db.delete("History");
    return res;
  }
}
