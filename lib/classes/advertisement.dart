import 'package:ads_app/classes/category.dart';
import 'package:ads_app/classes/user.dart';
import 'package:ads_app/utils/generate_unique_id.dart';
import 'package:ads_app/utils/price_in_cents_formatter.dart';

class Advertisement {
  late String id;
  String name;
  String? description;
  int priceInCents;
  Category category;
  User advertiser;

  Advertisement({
    required this.id,
    required this.name,
    this.description,
    required this.priceInCents,
    required this.category,
    required this.advertiser,
  });

  Advertisement.create({
    required this.name,
    this.description,
    required this.priceInCents,
    required this.category,
    required this.advertiser,
  }) {
    id = generateUniqueId();
  }

  String get formattedPrice {
    return priceInCentsFormatter(priceInCents);
  }
}
