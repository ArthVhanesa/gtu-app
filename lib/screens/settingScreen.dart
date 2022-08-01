// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gtu_app/components/AboutApp.dart';
import 'package:gtu_app/components/Header.dart';
import 'package:gtu_app/controllers/signInController.dart';
import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/dynamic_data.dart';
import 'package:gtu_app/image.dart';
import 'package:gtu_app/screens/logInScreen.dart';
import 'package:gtu_app/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:in_app_review/in_app_review.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  final InAppReview inAppReview = InAppReview.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colors.bgColor,
      body: SafeArea(
          child: Column(
        children: [
          Header(card: settingScreen),
          Padding(
            padding: padding,
            child: Column(
              children: [
                SettingMenu(
                  title: 'Share',
                  firstMenuTitle: 'Share App',
                  firstIcon: Icons.ios_share,
                  firstMenuOnTap: () {
                    Share.share(shareAppMessage);
                  },
                  secondMenuTitle: 'Rate App',
                  secondIcon: Icons.star,
                  // secondMenuOnTap: () {
                  //   inAppReview.requestReview();
                  // },
                  secondMenuOnTap: () async {
                    String url = astronApps;

                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url),
                          mode: LaunchMode.externalApplication,
                          webViewConfiguration: const WebViewConfiguration(
                            enableJavaScript: true,
                            enableDomStorage: true,
                          ));
                    }
                  },
                  color: _colors.skyBlueColor,
                ),
                SettingMenu(
                  title: 'Help & Feedback',
                  firstMenuTitle: 'Feedback',
                  firstIcon: Icons.send,
                  firstMenuOnTap: sendMail(
                    subject: HelpFeedback().subject,
                    body: HelpFeedback().body,
                  ),
                  secondMenuTitle: 'Bug report',
                  secondIcon: Icons.pest_control_outlined,
                  secondMenuOnTap: sendMail(
                    subject: BugReport().subject,
                    body: BugReport().body,
                  ),
                  color: _colors.orangeColor,
                ),
                SettingMenu(
                  title: 'About',
                  firstMenuTitle: 'Other Apps',
                  firstIcon: FontAwesomeIcons.googlePlay,
                  firstMenuOnTap: () async {
                    final url = astronApps;

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
                  secondMenuTitle: 'About App',
                  secondIcon: Icons.info_outline,
                  secondMenuOnTap: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: _colors.bgColor,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15))),
                        builder: (context) {
                          return AboutApp();
                        });
                  },
                  color: _colors.pistaColor,
                )
              ],
            ),
          ),
          logoutButton(context)
        ],
      )),
    );
  }

  logoutButton(BuildContext context) {
    final signinController = Get.put(SignInController());

    TextStyle style = _fontStyle
        .montserrat(12, FontWeight.w600)
        .copyWith(decoration: TextDecoration.underline);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //Terms Privacy and version
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: (() {}),
                        child: Text(
                          'Terms',
                          style: style,
                        )),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(
                        Icons.circle,
                        size: 6,
                      ),
                    ),
                    InkWell(
                      onTap: (() {}),
                      child: Text(
                        'Privacy',
                        style: style,
                      ),
                    ),
                  ],
                ),
                Text(
                  'v. ${version}',
                  style: style,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // logout button
            Container(
              width: MediaQuery.of(context).size.width,
              height: 55,
              decoration: BoxDecoration(
                color: _colors.lavenderColor,
                borderRadius: const BorderRadius.all(Radius.circular(25)),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  onTap: () {
                    signinController.logOut();
                  },
                  child: Center(
                    child: Text(
                      'Log out',
                      style: _fontStyle
                          .montserrat(20, FontWeight.w600)
                          .copyWith(color: _colors.titleColor),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void Function() sendMail({required String subject, required String body}) {
    return () async {
      final url = 'mailto:$toEmail?subject=$subject&body=$body';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      }
    };
  }
}

class SettingMenu extends StatelessWidget {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  String title;
  String firstMenuTitle;
  String secondMenuTitle;
  IconData firstIcon;
  IconData secondIcon;
  void Function() firstMenuOnTap;
  void Function() secondMenuOnTap;
  Color color;

  SettingMenu({
    Key? key,
    required this.title,
    required this.firstMenuTitle,
    required this.secondMenuTitle,
    required this.firstIcon,
    required this.secondIcon,
    required this.firstMenuOnTap,
    required this.secondMenuOnTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: _fontStyle.montserrat(16, FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            menuButton(
                context, color, firstMenuTitle, firstIcon, firstMenuOnTap),
            menuButton(
                context, color, secondMenuTitle, secondIcon, secondMenuOnTap),
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  menuButton(
    BuildContext context,
    Color color,
    String menuTitle,
    IconData menuIcon,
    void Function() onTap,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                menuIcon,
                size: 40,
                color: _colors.titleColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                menuTitle,
                style: _fontStyle
                    .montserrat(15, FontWeight.w500)
                    .copyWith(color: _colors.titleColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
