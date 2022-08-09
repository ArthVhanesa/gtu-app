import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:gtu_app/components/custom_snackbar.dart';

import 'package:gtu_app/models/user_model.dart';
import 'package:gtu_app/provider/provider.dart';
import 'package:gtu_app/screens/drawer_screen.dart';
import 'package:gtu_app/screens/log_in_data_screen.dart';
import 'package:gtu_app/screens/log_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInController extends GetxController with StateMixin<dynamic> {
  late SharedPreferences prefs;
  final dbUserData = DbUserModel().obs;
  GoogleProfileModel googleUserData = GoogleProfileModel();

  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();

    //get userData on init to decide initial screen (login screen or home screen.)
    GoogleProfileModel userData = GoogleProfileModel.fromJson(
        jsonDecode(prefs.getString("userData") ?? "{}"));
    if (userData.email != null) {
      googleUserData = userData;
      isUserAlreadyRegistered(userData.email ?? "");
    }
    log("storedData ${userData.toJson()}");
    change(userData, status: RxStatus.success());
    super.onInit();
  }

  void loginWithGoogle() {
    Provider().signInWithGoogle().then((value) {
      log("value.user=> ${value.user}");
      if (value.user != null) {
        GoogleProfileModel userData = GoogleProfileModel(
            uid: value.user!.uid,
            displayName: value.user!.displayName,
            firstName: value.user!.displayName!.split(" ")[0],
            lastName: value.user!.displayName!.split(" ")[1],
            email: value.user!.email,
            photoURL: value.user!.photoURL,
            phoneNumber: value.user!.phoneNumber);

        googleUserData = userData;
        //set userData to shared preference to stop login again and again.
        prefs.setString("userData", jsonEncode(userData.toJson()));
        change(userData, status: RxStatus.success());
        isUserAlreadyRegistered(userData.email ?? "");
      }
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  void isUserAlreadyRegistered(String email) {
    Provider().getUserByEmail(email).then((value) {
      log("UserDatabase:$value");
      dbUserData.value = DbUserModel.fromJson(value);
      log(dbUserData.value.enrollmentNo ?? "");

      // Go to HomePage when Sign in successfull.
      Get.to(() => const ZoomDrawerScreen());
    }, onError: (err) {
      Get.to(() => const LogIn2Screen());
    });
  }

  void registerNewUser(String fname, String lname, String enrollment) {
    Provider()
        .registerNewUser(googleUserData.email ?? "", fname, lname, enrollment)
        .then((value) {
      log("registered: $value");
      dbUserData.value = DbUserModel.fromJson(value['document']);
      ShowCustomSnackBar.success(message: "Successfully registered.");
      Get.to(() => const ZoomDrawerScreen());
    }, onError: (err) {
      ShowCustomSnackBar.error(message: err['error_message'] ?? "");
    });
  }

  void logOut() {
    Provider().logOut().then((val) {
      GoogleProfileModel userData =
          GoogleProfileModel(displayName: "Student", firstName: "Student");
      prefs.setString("userData", jsonEncode(userData.toJson()));

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
