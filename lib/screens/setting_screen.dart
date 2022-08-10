import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gtu_app/utils/launch_url.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';

import 'package:gtu_app/app_data.dart';
import 'package:gtu_app/components/about_app.dart';
import 'package:gtu_app/components/header.dart';
import 'package:gtu_app/controllers/sign_in_controller.dart';
import 'package:gtu_app/data/card_data.dart';
import 'package:gtu_app/style/style.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final InAppReview inAppReview = InAppReview.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
          child: Column(
        children: [
          Header(card: settingScreen),
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
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
                          secondMenuOnTap:
                              LaunchUrl().externalApplication(url: astronApps),
                          color: AppColors.skyBlueColor,
                        ),
                        SettingMenu(
                          title: 'Help & Feedback',
                          firstMenuTitle: 'Feedback',
                          firstIcon: Icons.send,
                          firstMenuOnTap: LaunchUrl().sendMail(
                            subject: HelpFeedback.subject,
                            body: HelpFeedback.body,
                          ),
                          secondMenuTitle: 'Bug report',
                          secondIcon: Icons.pest_control_outlined,
                          secondMenuOnTap: LaunchUrl().sendMail(
                            subject: BugReport.subject,
                            body: BugReport.body,
                          ),
                          color: AppColors.orangeColor,
                        ),
                        SettingMenu(
                          title: 'About',
                          firstMenuTitle: 'Other Apps',
                          firstIcon: FontAwesomeIcons.googlePlay,
                          firstMenuOnTap:
                              LaunchUrl().externalApplication(url: astronApps),
                          secondMenuTitle: 'About App',
                          secondIcon: Icons.info_outline,
                          secondMenuOnTap: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: AppColors.bgColor,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(15))),
                                builder: (context) {
                                  return AboutApp();
                                });
                          },
                          color: AppColors.pistaColor,
                        ),
                        const SizedBox(height: 110),
                      ],
                    ),
                  ),
                ),
                logoutButton()
              ],
            ),
          ),
        ],
      )),
    );
  }

  logoutButton() {
    final signinController = Get.put(SignInController());

    TextStyle style = FontStyle.montserrat(12, FontWeight.w600)
        .copyWith(decoration: TextDecoration.underline);

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: AppColors.bgColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 25),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              //Terms Privacy and version
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: LaunchUrl().inAppWebView(url: termsOfUse),
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
                        onTap: LaunchUrl().inAppWebView(url: privacyPolicy),
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
                  color: AppColors.lavenderColor,
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
                        style: FontStyle.montserrat(20, FontWeight.w600)
                            .copyWith(color: AppColors.titleColor),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingMenu extends StatelessWidget {
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
          style: FontStyle.montserrat(16, FontWeight.w600),
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
                color: AppColors.titleColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                menuTitle,
                style: FontStyle.montserrat(15, FontWeight.w500)
                    .copyWith(color: AppColors.titleColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
