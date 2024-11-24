import 'package:ads_app/classes/advertisement.dart';
import 'package:ads_app/classes/category.dart';
import 'package:ads_app/classes/user.dart';
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
    await _seedAdvertisements();

    print("_______  DATABASE SEEDED _______");
  }

  static Future<void> _seedUsers() async {
    UserRepository userRepository = UserRepository();

    for (var user in usersMock) {
      User? findedUser = await userRepository.findById(user.id);
      if (findedUser != null) continue;
      await userRepository.create(user);
    }
  }

  static Future<void> _seedCategories() async {
    CategoryRepository categoryRepository = CategoryRepository();
    for (var category in categoriesMock) {
      Category? findedCategory = await categoryRepository.findById(category.id);
      if (findedCategory != null) continue;
      await categoryRepository.create(category);
    }
  }

  static Future<void> _seedAdvertisements() async {
    AdvertisementRepository advertisementRepository = AdvertisementRepository();
    for (var advertisement in advertisementsMock) {
      Advertisement? findedadvertisement =
          await advertisementRepository.findById(advertisement.id);
      if (findedadvertisement != null) continue;
      await advertisementRepository.create(advertisement);
    }
  }
}
