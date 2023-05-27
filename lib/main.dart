import 'package:expance_tracker/models/categories/catagory_model.dart';
import 'package:expance_tracker/models/transations/transation_model.dart';
import 'package:expance_tracker/screens/sereen_home.dart';
import 'package:expance_tracker/transation_screens/transation_add/transation_add_screen.dart';
import 'package:expance_tracker/transation_screens/updatetransscreen/updatetransationscreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(catagorytypeAdapter().typeId)) {
    Hive.registerAdapter(catagorytypeAdapter());
  }
  if (!Hive.isAdapterRegistered(TransationModelAdapter().typeId)) {
    Hive.registerAdapter(TransationModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EXPANCE TRACKER',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
      routes: {
        screentransationadd.routename: (ctx) => const screentransationadd(),
        updatetransationsrc.routename: (ctx) => const updatetransationsrc()
      },
    );
  }
}
