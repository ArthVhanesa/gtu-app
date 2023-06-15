import 'dart:developer';

import 'package:get/get.dart';

import 'package:gtu_app/provider/provider.dart';

class TimeTableController extends GetxController with StateMixin<dynamic> {
  final semController = Get.put(SemController());
  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
  }

  void fetchTimeTableData(String branchCode) {
    change([], status: RxStatus.loading());
    Provider()
        .getTimeTableData(semController.selectedSem.value, branchCode)
        .then((value) {
      log("timetable: $value");
      change(value, status: RxStatus.success());
    }, onError: (error) {
      log("Error : ${error.toString()}");
      change(null, status: RxStatus.error(error['error_message']));
    });
  }
}

class SemController extends GetxController with StateMixin<dynamic> {
  final selectedSem = "".obs;

  @override
  void onInit() {
    Provider().getAllSem().then((value) {
      log(value.toString());
      selectedSem.value = value['sem'][0];
      change(value['sem'], status: RxStatus.success());
    }, onError: (error) {
      log(error.toString());
      change(null, status: RxStatus.error(error.toString()));
    });

    super.onInit();
  }

  void changeSem(String sem) {
    log("semchanged: $sem");
    this.selectedSem.value = sem;
  }
}
