import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/feature/add_task/view/add_task_page.dart';
import 'package:todoapp/utils/floor/dao/data_base.dart';
import 'package:todoapp/utils/notification/notification_utils.dart';
import 'package:todoapp/utils/set_up.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitApp().initScaffoldMessengerKey();
  final database =
      await $FloorAppDatabase.databaseBuilder('todo_database.db').build();
  final dao = database.todoDao;
  NotificationService().initNotification();
  NotificationService().requestPermissions();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      scaffoldMessengerKey: Get.find<GlobalKey<ScaffoldMessengerState>>(),
      home: AddTaskPage(),
    );
  }
}
