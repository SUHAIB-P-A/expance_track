import 'package:expance_tracker/models/transations/transation_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

const TRANSATION_DB = 'transation-db';

abstract class transationdbfunctions {
  Future<void> addtransations(TransationModel obj);
  Future<List<TransationModel>> gettransations();
}

class funcTransation implements transationdbfunctions {
  //single ton object
  funcTransation._internal();
  static funcTransation instance = funcTransation._internal();
  factory funcTransation() {
    return instance;
  }
  @override
  Future<void> addtransations(TransationModel obj) async {
    final transdb = await Hive.openBox<TransationModel>(TRANSATION_DB);
    await transdb.put(obj.id, obj);
    print(transdb);
  }

  @override
  Future<List<TransationModel>> gettransations() async{
    final gettrans = await Hive.openBox<TransationModel>(TRANSATION_DB);
    return  gettrans.values.toList();
  }
}
