import 'dart:developer';

import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:gtu_app/components/custom_snackbar.dart';
import 'package:gtu_app/provider/globals.dart';
import 'package:gtu_app/screens/log_in_screen.dart';

class InternetController extends GetxController {
  late final subscription;
  final isConnected = true.obs;

  @override
  void onInit() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      log("Offline");
      isConnected.value = false;
      ShowCustomSnackBar.noInternet();
    } else {
      log("back to online");
      AppGlobals.rootScaffoldMessengerKey.currentState!.removeCurrentSnackBar();
    }

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if (result == ConnectivityResult.none) {
        log("Offline");
        isConnected.value = false;
        ShowCustomSnackBar.noInternet();
      } else {
        log("back to online");
        AppGlobals.rootScaffoldMessengerKey.currentState!
            .removeCurrentSnackBar();
      }
      log("$result");
    });
    super.onInit();
  }

// Be sure to cancel subscription after you are done
  @override
  dispose() {
    super.dispose();
    subscription.cancel();
  }
}
