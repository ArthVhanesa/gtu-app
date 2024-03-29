import 'dart:developer';

import 'package:get/get.dart';

import 'package:gtu_app/components/custom_snackbar.dart';
import 'package:gtu_app/provider/provider.dart';

class QuestionPaperController extends GetxController with StateMixin<dynamic> {
  @override
  void onInit() {
    change([], status: RxStatus.success());
    super.onInit();
  }

  void fetchQuestionPaper(String subCode) {
    change(null, status: RxStatus.loading());
    Provider().getQuestionPapers(subCode).then((value) {
      if (value.length == 0) {
        change(null, status: RxStatus.error("No results found"));
      } else {
        change(value, status: RxStatus.success());
      }
    }, onError: (error) {
      log(error.toString());
      ShowCustomSnackBar.error(title: "Oh snap!", message: error.toString());
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
