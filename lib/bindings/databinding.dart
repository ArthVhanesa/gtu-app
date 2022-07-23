import 'package:get/get.dart';
import 'package:gtu_app/controllers/CircularController.dart';

class DataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllCircularController());
  }
}
