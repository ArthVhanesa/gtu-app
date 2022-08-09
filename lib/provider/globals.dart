import 'package:flutter/material.dart';

class AppGlobals {
  static final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static const API_URL = "http://20.124.121.10:5000";

  static Future<bool> onBackPressed() {
    rootScaffoldMessengerKey.currentState!.removeCurrentSnackBar();
    return Future.value(true);
  }
}
