// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:gtu_app/screens/homeScreen.dart';
import 'package:gtu_app/screens/introductionScreen.dart';
import 'package:gtu_app/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
    statusBarIconBrightness: Brightness.dark, //status barIcon Brightness
    // statusBarBrightness: Brightness.dark, //status bar brigtness
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icon
  ));
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;

  const MyApp({
    Key? key,
    required this.showHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppColors _color = AppColors();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'gtu_app',
      theme: ThemeData(
          scaffoldBackgroundColor: _color.bgColor,
          bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: Colors.black.withOpacity(0))),
      home: showHome ? HomeScreen() : IntroductionScreens(),
    );
  }
}
