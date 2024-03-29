import 'package:get/get.dart';

import 'package:gtu_app/provider/provider.dart';

class AcademicCalendarController extends GetxController
    with StateMixin<dynamic> {
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    Provider().getAcademicCalendar().then((value) {
      change(value, status: RxStatus.success());
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
