// ignore_for_file: annotate_overrides
import 'package:ads_app/db/interfaces/database_migration.dart';
import 'package:sqflite/sqflite.dart';

class CreateUsersTableDatabaseMigration implements DatabaseMigration {
  String get name => 'Create users table';
  int get version => 2;

  Future<void> execute(Database db) async {
    await db.execute('''
      CREATE TABLE users (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        email TEXT NOT NULL
      );
    ''');
  }

  Future<void> rollback(Database db) async {
    await db.execute('DROP TABLE IF EXISTS users');
  }
}
