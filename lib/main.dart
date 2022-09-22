import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_social_app_for_fun/MyHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Test project Demo',
      theme: ThemeData(
        fontFamily: 'Gilroy',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}
