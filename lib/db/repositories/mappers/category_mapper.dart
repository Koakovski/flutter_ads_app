import 'package:ads_app/classes/category.dart';
import 'package:flutter/material.dart';

class CategoryMapper {
  static Category toDomain(Map map) {
    return Category(
      id: map['id'],
      name: map['name'],
      icon: IconData(map['icon']),
    );
  }

  static Map toPersistence(Category category) {
    Map<String, dynamic> map = {
      'id': category.id,
      'name': category.name,
      'icon': category.icon.codePoint,
    };

    return map;
  }
}