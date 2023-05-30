import 'package:hive_flutter/hive_flutter.dart';
 part 'authentication_model.g.dart';

@HiveType(typeId: 4)
class AuthenticationModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String password;

  AuthenticationModel({
    required this.id,
    required this.email,
    required this.password,
  });
}
