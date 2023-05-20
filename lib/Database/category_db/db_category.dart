import 'package:expance_tracker/models/categories/catagory_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore: constant_identifier_names
const CATAGORY_DB = 'category-b=db';

// ignore: camel_case_types
abstract class db_categories {
  Future<List<Category_Model>> getcatagories();
  // ignore: non_constant_identifier_names
  Future<void> insert_category(Category_Model value);
  Future<void> deletecategory(String categoryid);
}

// ignore: camel_case_types
class catagory_db implements db_categories {
//single ton object
  catagory_db._internal();
  static catagory_db instance = catagory_db._internal();
  factory catagory_db() {
    return instance;
  }

  ValueNotifier<List<Category_Model>> incomecotegorylistlistner =
      ValueNotifier([]);
  ValueNotifier<List<Category_Model>> expancecotegorylistlistner =
      ValueNotifier([]);
  @override
  Future<void> insert_category(Category_Model value) async {
    final categorydb = await Hive.openBox<Category_Model>(CATAGORY_DB);
    await categorydb.put(value.id,value);
    refreshUI();
  }

  @override
  Future<List<Category_Model>> getcatagories() async {
    final categorydb = await Hive.openBox<Category_Model>(CATAGORY_DB);
    return  categorydb.values.toList();
  }

  Future<void> refreshUI() async {
    final _allcategory = await getcatagories();
    incomecotegorylistlistner.value.clear();
    expancecotegorylistlistner.value.clear();
    Future.forEach(_allcategory, (Category_Model categorysep) {
      if (categorysep.type == catagory_type.income) {
        incomecotegorylistlistner.value.add(categorysep);
      } else {
        expancecotegorylistlistner.value.add(categorysep);
      }
      incomecotegorylistlistner.notifyListeners();
      expancecotegorylistlistner.notifyListeners();
    });
  }

  @override
  Future<void> deletecategory(String categoryid) async{
    final delcategory = await Hive.openBox<Category_Model>(CATAGORY_DB);
    await delcategory.delete(categoryid);
    await refreshUI();
  }
}
