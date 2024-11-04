import 'package:ads_app/utils/generate_unique_id.dart';
import 'package:flutter/material.dart';

class Category {
  late String id;
  String name;
  IconData icon;

  Category({
    required this.id,
    required this.name,
    required this.icon,
  });

  Category.create({
    required this.name,
    required this.icon,
  }) {
    id = generateUniqueId();
  }
}
