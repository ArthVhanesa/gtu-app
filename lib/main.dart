// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gtu_app/controllers/signInController.dart';
import 'package:gtu_app/models/user_model.dart';
import 'package:gtu_app/provider/globals.dart';
import 'package:gtu_app/screens/drawerScreen.dart';
import 'package:gtu_app/screens/logInDataScreen.dart';
import 'package:gtu_app/screens/logInScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gtu_app/screens/introductionScreen.dart';
import 'package:gtu_app/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  final prefs = await SharedPreferences.getInstance();
  final isIntroDone = prefs.getBool('showHome') ?? false;

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
    statusBarIconBrightness: Brightness.dark, //status barIcon Brightness
    // statusBarBrightness: Brightness.dark, //status bar brigtness
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icon
  ));
  runApp(MyApp(isIntroDone: isIntroDone, prefs: prefs));
}

class MyApp extends StatelessWidget {
  final bool isIntroDone;
  final SharedPreferences prefs;

  const MyApp({Key? key, required this.isIntroDone, required this.prefs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppColors _color = AppColors();
    final signinController = Get.put(SignInController());
    final isUserLoggedin = UserProfileModel.fromJson(
                jsonDecode(prefs.getString("userData") ?? "{}"))
            .uid !=
        null;

    return GetMaterialApp(
        scaffoldMessengerKey: AppGlobals.rootScaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        title: 'gtu_app',
        theme: ThemeData(
          scaffoldBackgroundColor: _color.bgColor,
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.black.withOpacity(0),
          ),
        ),
        home: isIntroDone
            ? (isUserLoggedin ? ZoomDrawerScreen() : LogInScreen())
            : IntroductionScreens());
  }
}
