// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gtu_app/components/Header.dart';
import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/screens/settingScreen.dart';
import 'package:gtu_app/style.dart';
import 'package:get/get.dart';

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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                child: InkWell(
                  onTap: () {
                    Get.to(() => SettingScreen());
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
                        'Settings',
                        style: _fontStyle
                            .montserrat(20, FontWeight.w600)
                            .copyWith(color: _colors.titleColor),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
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
