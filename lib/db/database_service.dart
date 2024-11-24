import 'package:ads_app/db/helpers/database_migration_helper.dart';
import 'package:ads_app/db/migrations/create_advertisements_table_database_migration.dart';
import 'package:ads_app/db/migrations/create_categories_table_database_migration.dart';
import 'package:ads_app/db/migrations/create_users_table_database_migration.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Database? _db;

  static final DatabaseService _instance = DatabaseService.internal();

  factory DatabaseService() => _instance;

  DatabaseService.internal();

  Database get db {
    if (_db == null) {
      throw Exception("Database must be initialize before use it");
    }
    return _db!;
  }

  Future<void> initDb() async {
    if (_db != null) return;

    final databasePath = await getDatabasesPath();
    final path = "$databasePath/database.db";

    DatabaseMigrationHelper databaseMigrationHelper = DatabaseMigrationHelper([
      CreateCategoriesTableDatabaseMigration(),
      CreateUsersTableDatabaseMigration(),
      CreateAdvertisementsTableDatabaseMigration(),
    ]);

    _db = await openDatabase(
      path,
      version: 4,
      onCreate: databaseMigrationHelper.create,
      onDowngrade: databaseMigrationHelper.downgrade,
      onUpgrade: databaseMigrationHelper.upgrade,
    );
  }
}
