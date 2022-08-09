import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import 'package:gtu_app/models/user_model.dart';
import 'package:gtu_app/provider/provider.dart';
import 'package:gtu_app/screens/log_in_data_screen.dart';
import 'package:gtu_app/screens/log_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInController extends GetxController with StateMixin<dynamic> {
  late SharedPreferences prefs;

  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();

    //get userData on init to decide initial screen (login screen or home screen.)
    UserProfileModel userData = UserProfileModel.fromJson(
        jsonDecode(prefs.getString("userData") ?? "{}"));
    log("storedData ${userData.toJson()}");
    change(userData, status: RxStatus.success());
    super.onInit();
  }

  void loginWithGoogle() {
    Provider().signInWithGoogle().then((value) {
      log("value.user=> ${value.user}");
      if (value.user != null) {
        UserProfileModel userData = UserProfileModel(
            uid: value.user!.uid,
            displayName: value.user!.displayName,
            firstName: value.user!.displayName!.split(" ")[0],
            lastName: value.user!.displayName!.split(" ")[1],
            email: value.user!.email,
            photoURL: value.user!.photoURL,
            phoneNumber: value.user!.phoneNumber);

        //set userData to shared preference to stop login again and again.
        prefs.setString("userData", jsonEncode(userData.toJson()));
        change(userData, status: RxStatus.success());
        //Go to HomePage when Sign in successfull.
        Get.to(() => const LogIn2Screen());
      }
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  void logOut() {
    Provider().logOut().then((val) {
      UserProfileModel userData =
          UserProfileModel(displayName: "Student", firstName: "Student");
      prefs.setString("userData", jsonEncode(userData.toJson()));
      //to show intro screen again.
      // prefs.setBool('showHome', false);
      change(userData, status: RxStatus.success());
      Get.offAll(() => const LogInScreen());
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
