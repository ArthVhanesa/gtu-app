import 'package:gtu_app/custome_tab.dart';
import 'package:gtu_app/pdf_viewer.dart';
import 'package:get/get.dart';

void launchUrl(String url) {
  String isPdf = url.substring(url.length - 4);
  if (isPdf == '.pdf') {
    Get.to(() => PdfViewer(url: url));
  } else {
    launchCustomTab(url);
  }
}
