import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:gtu_app/controllers/sign_in_controller.dart';
import 'package:gtu_app/models/user_model.dart';
import 'package:gtu_app/provider/globals.dart';
import 'package:gtu_app/screens/drawer_screen.dart';
import 'package:gtu_app/screens/introduction_screen.dart';
import 'package:gtu_app/screens/log_in_screen.dart';
import 'package:gtu_app/style/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  GoogleFonts.config.allowRuntimeFetching = false;

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
