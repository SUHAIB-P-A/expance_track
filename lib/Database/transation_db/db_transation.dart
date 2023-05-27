import 'package:expance_tracker/models/transations/transation_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const TRANSATION_DB = 'transation-db';

abstract class transationdbfunctions {
  Future<void> addtransations(TransationModel obj);
  Future<List<TransationModel>> gettransations();
  Future<void> deletetransation(String id);
}

class funcTransation implements transationdbfunctions {
  ValueNotifier<List<TransationModel>> transationlistnotifier =
      ValueNotifier([]);

  //single ton object
  funcTransation._internal();
  static funcTransation instance = funcTransation._internal();
  factory funcTransation() {
    return instance;
  }

  Future<void> refreshui() async {
    final _list = await gettransations();
    _list.sort((first, secound) => first.date.compareTo(secound.date));
    transationlistnotifier.value.clear();
    transationlistnotifier.value.addAll(_list);
    transationlistnotifier.notifyListeners();
  }

  @override
  Future<void> addtransations(TransationModel obj) async {
    final transdb = await Hive.openBox<TransationModel>(TRANSATION_DB);
    await transdb.put(obj.id, obj);
  }

  @override
  Future<List<TransationModel>> gettransations() async {
    final gettrans = await Hive.openBox<TransationModel>(TRANSATION_DB);
    return gettrans.values.toList();
  }

  @override
  Future<void> deletetransation(id) async {
    final deltrans = await Hive.openBox<TransationModel>(TRANSATION_DB);
    await deltrans.delete(id);
    refreshui();
  }
}
