import 'dart:developer';
import 'package:get/get.dart';
import 'package:gtu_app/components/CustomSnackBar.dart';
import 'package:gtu_app/provider/provider.dart';

class SyllabusController extends GetxController with StateMixin<dynamic> {
  @override
  void onInit() {
    initialFetch();
    super.onInit();
  }

  void initialFetch() {
    change(null, status: RxStatus.loading());
    Provider().getInitialSyllabusData().then((value) {
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
    Provider().getSearchedSyllabusData(subCode).then((value) {
      log("searchResult: $value");
      change([value], status: RxStatus.success());
    }, onError: (error) {
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
