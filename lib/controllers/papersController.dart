import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:gtu_app/provider/provider.dart';

class QuestionPaperController extends GetxController with StateMixin<dynamic> {
  @override
  void onInit() {
    super.onInit();
  }

  void fetchQuestionPaper(String subCode) {
    Provider().getQuestionPapers(subCode).then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      log(error.toString());
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
