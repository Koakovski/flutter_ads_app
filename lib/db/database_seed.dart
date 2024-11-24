import 'package:ads_app/db/repositories/advertisement_repository.dart';
import 'package:ads_app/db/repositories/category_repository.dart';
import 'package:ads_app/db/repositories/user_repository.dart';
import 'package:ads_app/mocks/advertisements_mocks.dart';
import 'package:ads_app/mocks/category_mocks.dart';
import 'package:ads_app/mocks/user_mocks.dart';

class DatabaseSeed {
  static Future<void> execute() async {
    print("_______ SEEDING DATABASE _______");

    await Future.wait([_seedUsers(), _seedCategories()]);
    await _seedAdvertisments();

    print("_______  DATABASE SEEDED _______");
  }

  static Future<void> _seedUsers() async {
    for (var user in usersMock) {
      await UserRepository().upsert(user);
    }
  }

  static Future<void> _seedCategories() async {
    for (var category in categoriesMock) {
      await CategoryRepository().upsert(category);
    }
  }

  static Future<void> _seedAdvertisments() async {
    for (var adivertisement in advertisementsMock) {
      await AdvertisementRepository().upsert(adivertisement);
    }
  }
}
