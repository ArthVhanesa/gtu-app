import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtu_app/components/edit_field.dart';

import 'package:gtu_app/components/header.dart';
import 'package:gtu_app/controllers/sign_in_controller.dart';
import 'package:gtu_app/data/card_data.dart';
import 'package:gtu_app/screens/setting_screen.dart';
import 'package:gtu_app/style/style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final signinController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        children: [
          Header(card: profileScreen),
          Padding(
              padding: padding,
              child: Obx(() {
                final userData = signinController.dbUserData.value;
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileData.editable(
                        context: context,
                        title: 'Name 🖊️',
                        data:
                            "${userData.firstName ?? "Anonymous"} ${userData.lastName ?? ""}",
                        onTap: () {
                          Get.closeCurrentSnackbar();
                          ShowEditDialog.nameEditDialog(context: context);
                        },
                      ),
                      ProfileData.editable(
                        context: context,
                        title: 'Enrollment No. 🔢',
                        data: userData.enrollmentNo ?? "",
                        onTap: () {
                          Get.closeCurrentSnackbar();
                          ShowEditDialog.enrollmentEditDialog(context: context);
                        },
                      ),
                      ProfileData.initial(
                        title: 'Admission year 🗓',
                        data: userData.admissionYear ?? "",
                      ),
                      ProfileData.initial(
                        title: 'Course 🎓',
                        data: 'B.E.',
                      ),
                      ProfileData.initial(
                        title: 'Branch ⚡️',
                        data: userData.branchName ?? "",
                      ),
                      ProfileData.initial(
                        title: 'College 🏫',
                        data: userData.collegeName ?? "",
                      ),
                    ]);
              })),
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
          color: AppColors.lavenderColor,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            onTap: () {
              Get.closeCurrentSnackbar();
              Get.to(() => const SettingScreen());
            },
            child: Center(
              child: Text(
                'Settings',
                style: FontStyle.montserrat(20, FontWeight.w600)
                    .copyWith(color: AppColors.titleColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileData {
  static initial({required String title, required String data}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: FontStyle.montserrat(16, FontWeight.bold),
        ),
        Text(
          data,
          style: FontStyle.montserrat(20, FontWeight.normal),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  static editable(
      {required context,
      required String title,
      required String data,
      required void Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: FontStyle.montserrat(16, FontWeight.bold),
            ),
            Text(
              data,
              style: FontStyle.montserrat(20, FontWeight.normal),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
        const SizedBox(width: 10),
        InkResponse(
            containedInkWell: false,
            radius: 20,
            onTap: onTap,
            child: Icon(
              Icons.edit_outlined,
              color: AppColors.blackColor.withAlpha(140),
            ))
      ],
    );
  }
}
