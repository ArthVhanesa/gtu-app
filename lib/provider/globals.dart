import 'dart:io';

import 'package:get/get.dart';

import 'package:flutter/material.dart';

class AppGlobals {
  static final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static const API_URL = "http://20.124.121.10:5000";
  // static const API_URL = "http://192.168.0.101:5001";
  // static const API_URL = "https://bookocean-app.herokuapp.com";

  static Future<bool> onBackPressed() {
    Get.closeCurrentSnackbar();
    // rootScaffoldMessengerKey.currentState!.removeCurrentSnackBar();
    return Future.value(true);
  }
}
