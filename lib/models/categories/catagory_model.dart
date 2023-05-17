import 'package:hive_flutter/hive_flutter.dart';
part 'catagory_model.g.dart';

@HiveType(typeId: 2)
enum catagory_type {

  @HiveField(0)
  income,

  @HiveField(1)
  expance,
}

@HiveType(typeId: 1)
class Category_Model {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final bool isDeleted;

  @HiveField(3)
  final catagory_type type;

  Category_Model({
    required this.id,
    required this.name,
    required this.type,
    this.isDeleted = false,
  });
}
