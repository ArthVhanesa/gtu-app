import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gtu_app/components/custom_snackbar.dart';

class AppGlobals {
  static final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static const API_URL = "http://20.124.121.10:5000";
  // static const API_URL = "http://192.168.0.101:5001";
  // static const API_URL = "https://bookocean-app.herokuapp.com";

  static Future<bool> onBackPressed() {
    rootScaffoldMessengerKey.currentState!.removeCurrentSnackBar();
    return Future.value(true);
  }

  static Future<bool> checkInternetConnection() async {
    var isInternetAvailable = true;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        // ShowCustomSnackBar.success(message: "You are online.");
      }
    } on SocketException catch (_) {
      isInternetAvailable = false;
      ShowCustomSnackBar.error(message: "You are offline");
    }
    return isInternetAvailable;
  }
}
