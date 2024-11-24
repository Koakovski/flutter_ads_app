// ignore_for_file: annotate_overrides
import 'package:ads_app/db/interfaces/database_migration.dart';
import 'package:sqflite/sqflite.dart';

class CreateAdvertisementsTableDatabaseMigration implements DatabaseMigration {
  String get name => 'Create advertisements table';
  int get version => 4; // skip version 3 to test

  Future<void> execute(Database db) async {
    await db.execute('''
      CREATE TABLE advertisements (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        description TEXT,
        image_path TEXT,
        price_in_cents INTEGER NOT NULL,
        category_id TEXT NOT NULL,
        advertiser_id TEXT NOT NULL,
        FOREIGN KEY (category_id) REFERENCES category(id),
        FOREIGN KEY (advertiser_id) REFERENCES user(id)
      );
    ''');
  }

  Future<void> rollback(Database db) async {
    await db.execute('DROP TABLE IF EXISTS advertisements');
  }
}
