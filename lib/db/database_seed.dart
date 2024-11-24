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
    List<User> users = await userRepository.findAll();
    if (users.isNotEmpty) return;

    for (var user in usersMock) {
      await userRepository.create(user);
    }
  }

  static Future<void> _seedCategories() async {
    CategoryRepository categoryRepository = CategoryRepository();
    List<Category> categories = await categoryRepository.findAll();
    if (categories.isNotEmpty) return;

    for (var category in categoriesMock) {
      await categoryRepository.create(category);
    }
  }

  static Future<void> _seedAdvertisements() async {
    AdvertisementRepository advertisementRepository = AdvertisementRepository();
    List<Advertisement> advertisments = await advertisementRepository.findAll();
    if (advertisments.isNotEmpty) return;

    for (var advertisement in advertisementsMock) {
      await advertisementRepository.create(advertisement);
    }
  }
}
