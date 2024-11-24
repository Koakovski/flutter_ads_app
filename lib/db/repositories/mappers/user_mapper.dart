import 'package:ads_app/classes/user.dart';

class UserMapper {
  static User toDomain(Map map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
    );
  }

  static Map<String, Object?> toPersistence(User user) {
    return {
      'id': user.id,
      'name': user.name,
      'email': user.email,
    };
  }
}
