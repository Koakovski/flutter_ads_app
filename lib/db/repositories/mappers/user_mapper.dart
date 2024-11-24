import 'package:ads_app/classes/user.dart';

class UserMapper {
  static User toDomain(Map map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
    );
  }

  static Map toPersistence(User user) {
    Map<String, dynamic> map = {
      'id': user.id,
      'name': user.name,
      'email': user.email,
    };

    return map;
  }
}
