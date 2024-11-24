import 'package:ads_app/classes/User.dart';
import 'package:ads_app/db/database_service.dart';
import 'package:ads_app/db/repositories/mappers/user_mapper.dart';
import 'package:sqflite/sqflite.dart';

class UserRepository {
  final Database _dbService = DatabaseService().db;

  Future<void> create(User user) async {
    await _dbService.insert('users', UserMapper.toPersistence(user));
  }
}
