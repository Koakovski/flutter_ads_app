import 'package:ads_app/utils/generate_unique_id.dart';

class User {
  late String id;
  String name;
  String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  User.create({
    required this.name,
    required this.email,
  }) {
    id = generateUniqueId();
  }
}
