// ignore_for_file: annotate_overrides
import 'package:ads_app/db/interfaces/database_migration.dart';
import 'package:sqflite/sqflite.dart';

class CreateCategoriesTableDatabaseMigration implements DatabaseMigration {
  String get name => 'Create categories table';
  int get version => 1;

  Future<void> execute(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS categories (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        icon INTEGER NOT NULL
      );
    ''');
  }

  Future<void> rollback(Database db) async {
    await db.execute('DROP TABLE IF EXISTS categories');
  }
}
