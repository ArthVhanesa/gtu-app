import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gtu_app/controllers/internet_status_controller.dart';
import 'package:gtu_app/controllers/sign_in_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:gtu_app/models/user_model.dart';
import 'package:gtu_app/provider/globals.dart';
import 'package:gtu_app/screens/drawer_screen.dart';
import 'package:gtu_app/screens/introduction_screen.dart';
import 'package:gtu_app/screens/log_in_screen.dart';
import 'package:gtu_app/style/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  GoogleFonts.config.allowRuntimeFetching = true;

  final prefs = await SharedPreferences.getInstance();
  final isIntroDone = prefs.getBool('showHome') ?? false;

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // status bar color
      statusBarIconBrightness: Brightness.dark, //status barIcon Brightness
      systemStatusBarContrastEnforced: false,
      // statusBarBrightness: Brightness.dark, //status bar brigtness
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icon
      systemNavigationBarContrastEnforced: false,
    ),
  );

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top]);

  runApp(MyApp(isIntroDone: isIntroDone, prefs: prefs));
}

class MyApp extends StatelessWidget {
  final bool isIntroDone;
  final SharedPreferences prefs;
  final _ = Get.put(InternetController());
  final signinController = Get.put(SignInController());

  MyApp({Key? key, required this.isIntroDone, required this.prefs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isUserLoggedin =
        DbUserModel.fromJson(jsonDecode(prefs.getString("userData") ?? "{}"))
                .email !=
            null;

    return GetMaterialApp(
        scaffoldMessengerKey: AppGlobals.rootScaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        title: 'GTU Info',
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.bgColor,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color(0x00ffffff),
            )),
        home: isIntroDone
            ? (isUserLoggedin ? ZoomDrawerScreen() : const LogInScreen())
            : const IntroductionScreens());
  }
}
