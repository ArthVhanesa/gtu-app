import 'dart:developer';

import 'package:get/get.dart';

import 'package:gtu_app/components/custom_snackbar.dart';
import 'package:gtu_app/controllers/sign_in_controller.dart';
import 'package:gtu_app/models/user_model.dart';
import 'package:gtu_app/provider/provider.dart';
import 'package:gtu_app/utils/utils_functions.dart';

class SyllabusController extends GetxController with StateMixin<dynamic> {
  final signInController = Get.put(SignInController());
  late DbUserModel userData;
  @override
  void onInit() {
    userData = signInController.dbUserData.value;
    // initialFetch();
    super.onInit();
  }

  void initialFetch() {
    change(null, status: RxStatus.loading());
    final sem = Utils.getSem(int.parse(userData.admissionYear ?? "2020"));

    Provider()
        .getInitialSyllabusData(userData.branchCode ?? "06", sem.toString())
        .then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      log(error.toString());
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  void fetchSearchedSyllabus(String subCode) {
    change(null, status: RxStatus.loading());
    if (subCode == "") {
      initialFetch();
      return;
    }
    Provider().getSearchedSyllabusData(subCode, userData.branchCode!).then(
        (value) {
      log("searchResult: $value");
      change(value, status: RxStatus.success());
    }, onError: (error) {
      log(error.toString());
      change(null, status: RxStatus.error(error.toString()));
      ShowCustomSnackBar.error(title: "Oh Snap!", message: error.toString());
      log("Error : ${error.toString()}");
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
