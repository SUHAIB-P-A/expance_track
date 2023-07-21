import 'package:hive_flutter/hive_flutter.dart';
part 'budgetmodel.g.dart';

@HiveType(typeId: 5)
class Budget {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final double budget;

  Budget({required this.budget ,required this.id});
}
