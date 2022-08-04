import 'package:get/get.dart';

import 'package:gtu_app/utils/custome_tab.dart';
import 'package:gtu_app/utils/pdf_viewer.dart';

void launchTab(String url) {
  String isPdf = url.substring(url.length - 4);
  if (isPdf == '.pdf') {
    Get.to(() => PdfViewer(url: url));
  } else {
    launchCustomTab(url);
  }
}
