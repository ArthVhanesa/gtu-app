import 'dart:developer';

import 'package:get/get.dart';
import 'package:gtu_app/provider/provider.dart';

class TimeTableController extends GetxController with StateMixin<dynamic> {
  @override
  void onInit() {
    Provider().getAllSem().then((value) {
      log(value.toString());
      change(value, status: RxStatus.success());
    }, onError: (error) {
      log(error.toString());
      change(null, status: RxStatus.error(error.toString()));
    });

    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
