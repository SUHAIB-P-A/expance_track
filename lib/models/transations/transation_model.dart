import 'package:expance_tracker/models/categories/catagory_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'transation_model.g.dart';

@HiveType(typeId: 3)
class TransationModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  final String purpos;

  @HiveField(2)
  final double amount;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final catagory_type type;

  @HiveField(5)
  final Category_Model listitemscategory;

  TransationModel({
    this.id,
    required this.purpos,
    required this.amount,
    required this.date,
    required this.type,
    required this.listitemscategory,
  });
}
