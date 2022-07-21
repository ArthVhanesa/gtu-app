import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gtu_app/screens/homeScreen.dart';
import 'package:gtu_app/style.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
    statusBarIconBrightness: Brightness.dark, //status barIcon Brightness
    // statusBarBrightness: Brightness.dark, //status bar brigtness
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icon
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors _color = AppColors();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'gtu_app',
      theme: ThemeData(
        scaffoldBackgroundColor: _color.bgColor,
      ),
      home: HomeScreen(),
    );
  }
}
