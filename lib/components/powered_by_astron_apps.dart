import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:gtu_app/components/heading.dart';
import 'package:gtu_app/style/style.dart';

class PoweredbyAstronApps extends StatelessWidget {
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
            style: FontStyle.ebGaramond(20, FontWeight.w600),
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
              style: FontStyle.ebGaramond(25, FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
