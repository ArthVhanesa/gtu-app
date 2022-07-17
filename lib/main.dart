import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gtu_app/screens/circularScreen.dart';
import 'package:gtu_app/screens/homeScreen.dart';
import 'package:gtu_app/screens/questionPaperScreen.dart';
import 'package:gtu_app/screens/syllabusScreen.dart';
import 'package:gtu_app/style.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
    statusBarIconBrightness: Brightness.dark, //status barIcon Brightness
    // statusBarBrightness: Brightness.dark, //status bar brigtness
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    // systemNavigationBarDividerColor: Colors.greenAccent, //Navigation bar divider color
    systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icon
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'gtu_app',
      home: HomeScreen(),
    );
  }
}
