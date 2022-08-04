import 'package:gtu_app/app_data.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchUrl {
  void Function() inAppWebView({required String url}) {
    return () async {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(
          Uri.parse(url),
          mode: LaunchMode.inAppWebView,
          webViewConfiguration: const WebViewConfiguration(
            enableJavaScript: true,
            enableDomStorage: true,
          ),
        );
      }
    };
  }

  void Function() externalApplication({required String url}) {
    return () async {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(
          Uri.parse(url),
          mode: LaunchMode.externalApplication,
          webViewConfiguration: const WebViewConfiguration(
            enableJavaScript: true,
            enableDomStorage: true,
          ),
        );
      }
    };
  }

  sendMail({required String subject, required String body}) {
    return () async {
      final url = 'mailto:$toEmail?subject=$subject&body=$body';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      }
    };
  }
}
