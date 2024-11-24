import 'package:ads_app/classes/user.dart';
import 'package:ads_app/db/database_service.dart';
import 'package:ads_app/db/repositories/mappers/user_mapper.dart';
import 'package:sqflite/sqflite.dart';

class UserRepository {
  final Database _dbService = DatabaseService().db;

  Future<List<User>> findAll() async {
    final List<Map> persistenceCategories = await _dbService.rawQuery('''
      SELECT 
        *
      FROM 
        users
    ''');

    return persistenceCategories
        .map((map) => UserMapper.toDomain(map))
        .toList();
  }

  Future<void> upsert(User user) async {
    final existingUser = await _dbService.query(
      'users',
      where: 'id = ?',
      whereArgs: [user.id],
    );

    if (existingUser.isEmpty) {
      await create(user);
    } else {
      await update(user);
    }
  }

  Future<void> create(User user) async {
    await _dbService.insert('users', UserMapper.toPersistence(user));
  }

  Future<void> update(User user) async {
    await _dbService.update(
      'users',
      UserMapper.toPersistence(user),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }
}
