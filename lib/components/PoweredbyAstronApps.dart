import 'package:flutter/material.dart';
import 'package:gtu_app/components/Heading.dart';
import 'package:gtu_app/style.dart';
import 'package:url_launcher/url_launcher.dart';

class PoweredbyAstronApps extends StatelessWidget {
  final FontStyle _fontStyle = FontStyle();

  PoweredbyAstronApps({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Dot(size: 8)),
          const SizedBox(height: 40),
          Text(
            'Powered by',
            style: _fontStyle.ebGaramond(20, FontWeight.w600),
          ),
          InkWell(
            onTap: () async {
              const url =
                  'https://play.google.com/store/apps/dev?id=9082115799273054085';

              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url),
                    mode: LaunchMode.externalApplication,
                    webViewConfiguration: const WebViewConfiguration(
                      enableJavaScript: true,
                      enableDomStorage: true,
                    ));
              }
            },
            splashFactory: NoSplash.splashFactory,
            child: Text(
              'Astron Apps⚡️',
              style: _fontStyle.ebGaramond(25, FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
