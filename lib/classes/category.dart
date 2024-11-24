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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Category && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
