
import 'package:expance_tracker/models/authentication/authentication_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

const AUTHENTICATION_DB = 'logindb';

Future<void> addlogindetails(AuthenticationModel value) async {
  final _login_db = await Hive.openBox<AuthenticationModel>(AUTHENTICATION_DB);
  await _login_db.put(value.id, value);
}

Future<List<AuthenticationModel>>getlogindetails()async{
  final _login_db = await Hive.openBox<AuthenticationModel>(AUTHENTICATION_DB);
  List<AuthenticationModel> data = _login_db.values.toList().cast<AuthenticationModel>();
  return data;
}