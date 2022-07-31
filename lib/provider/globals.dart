import 'package:flutter/material.dart';

class AppGlobals {
  static final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static const API_URL = "https://bookocean-app.herokuapp.com";

  static Future<bool> onBackPressed() {
    rootScaffoldMessengerKey.currentState!.removeCurrentSnackBar();
    return Future.value(true);
  }
}
