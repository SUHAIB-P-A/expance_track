import 'package:expance_tracker/models/budget/budgetmodel.dart';
import 'package:hive_flutter/hive_flutter.dart';

const budgetdb = 'budgetdb';

Future<void> addbudget(Budget value) async {
  final _budget_db = await Hive.openBox<Budget>(budgetdb);
  await _budget_db.put(value.id, value);
 
}

Future<void> cleardb() async {
  final clr = await Hive.openBox<Budget>(budgetdb);
  await clr.clear();
}

Future<List<Budget>> getBudgetValue() async {
  final _budget_db = await Hive.openBox<Budget>(budgetdb);
  final budget = _budget_db.values;
  return budget.toList();
}