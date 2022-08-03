import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gtu_app/components/header.dart';
import 'package:gtu_app/data/card_data.dart';
import 'package:gtu_app/screens/setting_screen.dart';
import 'package:gtu_app/style/style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colors.bgColor,
      body: SafeArea(
          child: Column(
        children: [
          Header(card: profileScreen),
          Padding(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileData(
                  title: 'Name 🖊️',
                  data: 'Arth',
                ),
                ProfileData(
                  title: 'Enrollment No. 🔢',
                  data: '200280116029',
                ),
                ProfileData(
                  title: 'Admission year 🗓',
                  data: '2020',
                ),
                ProfileData(
                  title: 'Course 🎓',
                  data: 'B.E.',
                ),
                ProfileData(
                  title: 'Branch ⚡️',
                  data: 'Information Technology',
                ),
                ProfileData(
                  title: 'College 🏫',
                  data: 'Lalbhai Dalpatbhai College of Engineering',
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: settingButton(),
            ),
          )
        ],
      )),
    );
  }

  settingButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
      child: Container(
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
              Get.to(() => SettingScreen());
            },
            child: Center(
              child: Text(
                'Settings',
                style: _fontStyle
                    .montserrat(20, FontWeight.w600)
                    .copyWith(color: _colors.titleColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileData extends StatelessWidget {
  final FontStyle _fontStyle = FontStyle();

  final String title;
  final String data;

  ProfileData({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: _fontStyle.montserrat(16, FontWeight.bold),
        ),
        Text(
          data,
          style: _fontStyle.montserrat(20, FontWeight.normal),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
