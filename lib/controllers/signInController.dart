import 'dart:developer';

import 'package:get/get.dart';
import 'package:gtu_app/provider/provider.dart';
import 'package:gtu_app/screens/logInDataScreen.dart';

class SignInController extends GetxController with StateMixin<dynamic> {
  @override
  void onInit() {
    super.onInit();
  }

  void loginWithGoogle() {
    Provider().signInWithGoogle().then((value) {
      log("value.user=> ${value.user}");
      //Go to HomePage when Sign in successfull.
      if (value.user != null) {
        change(value.user, status: RxStatus.success());
        Get.to(() => const LogIn2Screen());
      }
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
