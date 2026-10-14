import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    final dbPath = await getDatabasesPath();

    _database = await openDatabase(
      join(dbPath, 'expenzia.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE transactions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            type TEXT NOT NULL,
            name TEXT NOT NULL,
            amount REAL NOT NULL,
            date TEXT NOT NULL
          )
        ''');
      },
    );

    return _database!;
  }

  Future<int> insertTransaction(Map<String, dynamic> data) async {
    final db = await database;

    return await db.insert('transactions', data);
  }

  Future<List<Map<String, dynamic>>> getTransactions() async {
    final db = await database;

    return await db.query('transactions', orderBy: 'id DESC');
  }
}
