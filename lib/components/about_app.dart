import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:gtu_app/app_data.dart';
import 'package:gtu_app/style/image.dart';
import 'package:gtu_app/style/style.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({
    Key? key,
  }) : super(key: key);

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: _colors.titleColor,
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              children: [
                Container(
                  height: 240,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          logoImg,
                          height: 120,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            appName,
                            style: _fontStyle.manrope(18, FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Version $version',
                            style: _fontStyle
                                .montserrat(14, FontWeight.w500)
                                .copyWith(decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                      Text(
                        copyrightMessage,
                        style: _fontStyle
                            .montserrat(14, FontWeight.w500)
                            .copyWith(color: _colors.titleColor),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: _colors.blackColor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  child: Text(
                    aboutAppMessage,
                    style: _fontStyle.manrope(15, FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: _colors.blackColor,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'Developed and maintained by Astron Apps',
                        style: _fontStyle.manrope(20, FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          nameWithSocials(
                            name: Dev1().name,
                            linkedinLink: Dev1().linkedinLink,
                            twitterLink: Dev1().twitterLink,
                          ),
                          nameWithSocials(
                            name: Dev2().name,
                            linkedinLink: Dev2().linkedinLink,
                            twitterLink: Dev2().twitterLink,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  nameWithSocials(
      {required String name,
      required String linkedinLink,
      required String twitterLink}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          style: _fontStyle
              .manrope(18, FontWeight.w600)
              .copyWith(decoration: TextDecoration.underline),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            socialMediaButton(
              icon: FontAwesomeIcons.linkedinIn,
              link: linkedinLink,
            ),
            socialMediaButton(
              icon: FontAwesomeIcons.twitter,
              link: twitterLink,
            ),
          ],
        )
      ],
    );
  }

  socialMediaButton({required IconData icon, required String link}) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () async {
        final url = link;

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
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: FaIcon(
          icon,
          color: _colors.linkBlueColor,
        ),
      ),
    );
  }
}
