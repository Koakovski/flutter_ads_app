import 'dart:io';
import 'package:ads_app/classes/advertisement.dart';
import 'package:ads_app/classes/category.dart';
import 'package:ads_app/classes/user.dart';
import 'package:ads_app/db/repositories/mappers/User_mapper.dart';
import 'package:ads_app/db/repositories/mappers/category_mapper.dart';

class AdvertisementMapper {
  static Advertisement toDomain(Map map) {
    User user = UserMapper.toDomain({
      'id': map['user_id'],
      'name': map['user_name'],
      'email': map['user_email'],
    });

    Category category = CategoryMapper.toDomain({
      'id': map['category_id'],
      'name': map['category_name'],
      'icon': map['category_icon'],
    });

    return Advertisement(
      id: map['advertisement_id'],
      name: map['advertisement_name'],
      priceInCents: map['advertisement_price_in_cents'],
      description: map['advertisement_description'],
      image: map['advertisement_image_path']
          ? File(map['advertisement_image_path'])
          : null,
      advertiser: user,
      category: category,
    );
  }

  static Map<String, Object?> toPersistence(Advertisement advertisement) {
    return {
      'id': advertisement.id,
      'name': advertisement.name,
      'description': advertisement.description,
      'price_in_cents': advertisement.priceInCents,
      'image_path': advertisement.image?.path,
      'advertiser_id': advertisement.advertiser.id,
      'category_id': advertisement.category.id,
    };
  }
}
