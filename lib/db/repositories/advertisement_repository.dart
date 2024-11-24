import 'package:ads_app/classes/advertisement.dart';
import 'package:ads_app/db/database_service.dart';
import 'package:ads_app/db/repositories/mappers/advertisement_mapper.dart';
import 'package:sqflite/sqflite.dart';

class AdvertisementRepository {
  final Database _dbService = DatabaseService().db;

  Future<List<Advertisement>> findAll() async {
    final List<Map> persistenceAdvertisements = await _dbService.rawQuery('''
      SELECT 
        advertisements.id AS advertisement_id,
        advertisements.name AS advertisement_name,
        advertisements.description AS advertisement_description,
        advertisements.image_path AS advertisement_image_path,
        advertisements.price_in_cents AS advertisement_price_in_cents,

        categories.id AS category_id,
        categories.name AS category_name,
        categories.icon AS category_icon,

        users.id AS user_id,
        users.name AS user_name,
        users.email AS user_email
      FROM 
        advertisements
      JOIN 
        categories ON advertisements.category_id = categories.id
      JOIN 
        users ON advertisements.advertiser_id = users.id;
    ''');

    return persistenceAdvertisements
        .map((map) => AdvertisementMapper.toDomain(map))
        .toList();
  }

  Future<void> create(Advertisement advertisement) async {
    await _dbService.insert(
        'advertisments', AdvertisementMapper.toPersistence(advertisement));
  }

  Future<void> update(Advertisement advertisement) async {
    await _dbService.update(
      'advertisements',
      AdvertisementMapper.toPersistence(advertisement),
      where: 'id = ?',
      whereArgs: [advertisement.id],
    );
  }
}
