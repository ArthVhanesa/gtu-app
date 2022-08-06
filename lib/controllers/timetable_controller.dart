import 'dart:developer';

import 'package:get/get.dart';

import 'package:gtu_app/provider/provider.dart';

class TimeTableController extends GetxController with StateMixin<dynamic> {
  final sem = "".obs;
  final timeTableData = [].obs;

  @override
  void onInit() {
    Provider().getAllSem().then((value) {
      // log(value.toString());
      sem.value = value['sem'][0];
      change(value, status: RxStatus.success());
    }, onError: (error) {
      log(error.toString());
      change(null, status: RxStatus.error(error.toString()));
    });

    super.onInit();
  }

  void changeSem(String sem) {
    log("semchanged: $sem");
    this.sem.value = sem;
  }

  void fetchTimeTableData(String branchCode) {
    Provider().getTimeTableData(sem.value, branchCode).then((value) {
      log("timetable: $value");
      timeTableData.value = value;
    }, onError: (error) {
      log("Error : ${error.toString()}");
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
