import 'dart:developer';

import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:gtu_app/components/custom_snackbar.dart';

class InternetController extends GetxController {
  late final subscription;
  final isConnected = true.obs;

  @override
  void onInit() async {
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
        ShowCustomSnackBar.activeInternet();
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
