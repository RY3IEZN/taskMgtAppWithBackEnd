import 'package:flutter/material.dart';
import 'package:tskmgt_withbcknd/screens/add_task.dart';
import 'package:tskmgt_withbcknd/screens/all_tasks.dart';
import 'package:get/get.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}
