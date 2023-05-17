
import 'package:expance_tracker/models/categories/catagory_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

const CATAGORY_DB='category-b=db';
abstract class db_categories{
  Future<List<Category_Model>> getcatagories();
Future<void> insert_category(Category_Model value);
}

class catagory_db implements db_categories{
  @override
  Future<void> insert_category(Category_Model value) async{
 final categorydb = await Hive.openBox<Category_Model>(CATAGORY_DB);
 await categorydb.add(value);
  }
  
  @override
  Future<List<Category_Model>> getcatagories() async{
final categorydb= await Hive.openBox<Category_Model>(CATAGORY_DB);
return categorydb.values.toList();
}}