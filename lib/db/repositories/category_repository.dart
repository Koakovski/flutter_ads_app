import 'package:ads_app/classes/category.dart';
import 'package:ads_app/db/database_service.dart';
import 'package:ads_app/db/repositories/mappers/category_mapper.dart';
import 'package:sqflite/sqflite.dart';

class CategoryRepository {
  final Database _dbService = DatabaseService().db;

  Future<List<Category>> findAll(Category category) async {
    final List<Map> persistenceCategories = await _dbService.rawQuery('''
      SELECT 
        *
      FROM 
        categories
    ''');

    return persistenceCategories
        .map((map) => CategoryMapper.toDomain(map))
        .toList();
  }

  Future<void> create(Category category) async {
    await _dbService.insert(
      'categories',
      CategoryMapper.toPersistence(category),
    );
  }
}
