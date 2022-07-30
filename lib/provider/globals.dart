import 'package:flutter/material.dart';

class AppGlobals {
  static final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static Future<bool> onBackPressed() {
    rootScaffoldMessengerKey.currentState!.removeCurrentSnackBar();
    return Future.value(true);
  }
}
