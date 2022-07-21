// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gtu_app/components/Header.dart';
import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/screens/logInScreen.dart';
import 'package:gtu_app/style.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  String version = '0.0.0';

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
                  secondMenuTitle: 'Rate App',
                  secondIcon: Icons.star,
                  color: _colors.skyBlueColor,
                ),
                SettingMenu(
                  title: 'Help & Feedback',
                  firstMenuTitle: 'Feedback',
                  firstIcon: Icons.send,
                  secondMenuTitle: 'Bug report',
                  secondIcon: Icons.pest_control_outlined,
                  color: _colors.orangeColor,
                ),
                SettingMenu(
                  title: 'About',
                  firstMenuTitle: 'Other Apps',
                  firstIcon: Icons.apps,
                  secondMenuTitle: 'About App',
                  secondIcon: Icons.info_outline,
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
            InkWell(
              onTap: () {
                Get.to(() => LogInScreen());
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 55,
                decoration: BoxDecoration(
                    color: _colors.lavenderColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    )),
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
          ],
        ),
      ),
    );
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
  Color color;

  SettingMenu({
    Key? key,
    required this.title,
    required this.firstMenuTitle,
    required this.secondMenuTitle,
    required this.firstIcon,
    required this.secondIcon,
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
            menuButton(context, color, firstMenuTitle, firstIcon),
            menuButton(context, color, secondMenuTitle, secondIcon),
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
  ) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.40,
        height: 100,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            )),
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
    );
  }
}
