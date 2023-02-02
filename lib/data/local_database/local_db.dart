import 'package:fifth_exam/data/models/notification_model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static String tableName = "notification";
  static LocalDatabase getInstance = LocalDatabase._init();
  Database? _database;

  LocalDatabase._init();

  Future<Database> getDb() async {
    if (_database == null) {
      _database = await _initDB("notification.db");
      return _database!;
    }
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, fileName);

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
        String textType = "TEXT";
        await db.execute('''
        CREATE TABLE $tableName (
            ${NotificationFields.id} $idType,
            ${NotificationFields.newsImage} $textType,
            ${NotificationFields.newsTitle} $textType,
            ${NotificationFields.dateTime} $textType,
            ${NotificationFields.description} $textType
            )
            ''');
      },
    );
    return database;
  }

  static Future<BreakingNews> insertNotification(
      {required BreakingNews breakingNews}) async {
    var database = await getInstance.getDb();
    int id = await database.insert(tableName, breakingNews.toJson());
    debugPrint("ADD BOLDI HAMMASI YAXSHI");
    return breakingNews.copyWith(id: id);
  }

  static Future<List<BreakingNews>> getCachedNotification() async {
    var database = await getInstance.getDb();
    var listCountries = await database.query(
      tableName,
      columns: [
        NotificationFields.id,
        NotificationFields.newsImage,
        NotificationFields.newsTitle,
        NotificationFields.dateTime,
        NotificationFields.description,
      ],
    );
    var list = listCountries.map((e) => BreakingNews.fromJson(e)).toList();

    return list;
  }

  static Future<int> deleteAll() async {
    var database = await getInstance.getDb();
    return await database.delete(tableName);
  }
}
