import 'package:expance_tracker/AuthenticationScreen/login/login_screen.dart';
import 'package:expance_tracker/AuthenticationScreen/sign_up/signup_screen.dart';
import 'package:expance_tracker/models/authentication/authentication_model.dart';
import 'package:expance_tracker/models/budget/budgetmodel.dart';
import 'package:expance_tracker/models/categories/catagory_model.dart';
import 'package:expance_tracker/models/transations/transation_model.dart';
import 'package:expance_tracker/screens/sereen_home.dart';
//import 'package:expance_tracker/screens/wedgets/bottamnavigationbar.dart';
import 'package:expance_tracker/spalshscreen/spalsh_screen.dart';
//import 'package:expance_tracker/transation_screens/transation.dart';
import 'package:expance_tracker/transation_screens/transation_add/transation_add_screen.dart';
//import 'package:expance_tracker/transation_screens/updatetransscreen/updatetransationscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
      home: const ScreenSpalsh(),
      routes: {
        screentransationadd.routename: (ctx) => const screentransationadd(),
        //updatetransationsrc.routename: (context) => const updatetransationsrc(),
        Home.routename: (context) => const Home(),
        signupsrc.routename: (context) => signupsrc(),
        loginsrc.routename: (context) => loginsrc()
      },
      themeAnimationCurve: Curves.slowMiddle,
    );
  }
}

class Notification {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void initialisenotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
            '@mipmap/ic_launcher'); // Replace with your app icon name
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> shadulesendnotification(String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.periodicallyShow(
      0,
      title,
      body,
      RepeatInterval.everyMinute,
      platformChannelSpecifics,
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(BudgetAdapter().typeId)) {
    Hive.registerAdapter(BudgetAdapter());
  }
  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(catagorytypeAdapter().typeId)) {
    Hive.registerAdapter(catagorytypeAdapter());
  }
  if (!Hive.isAdapterRegistered(TransationModelAdapter().typeId)) {
    Hive.registerAdapter(TransationModelAdapter());
  }
  if (!Hive.isAdapterRegistered(AuthenticationModelAdapter().typeId)) {
    Hive.registerAdapter(AuthenticationModelAdapter());
  }
  final Notification notification = Notification();
  notification.initialisenotification();
  notification.shadulesendnotification('Xpenso', 'add your expense');
  runApp(const MyApp());
}
