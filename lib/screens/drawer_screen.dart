import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:gtu_app/controllers/internet_status_controller.dart';

import 'package:gtu_app/controllers/sign_in_controller.dart';
import 'package:gtu_app/data/menu_item.dart';
import 'package:gtu_app/screens/home_screen.dart';
import 'package:gtu_app/screens/profile_screen.dart';
import 'package:gtu_app/screens/setting_screen.dart';
import 'package:gtu_app/style/image.dart';
import 'package:gtu_app/style/style.dart';
import 'package:gtu_app/utils/custome_tab.dart';

class ZoomDrawerScreen extends StatefulWidget {
  const ZoomDrawerScreen({super.key});

  @override
  State<ZoomDrawerScreen> createState() => _ZoomDrawerScreenState();
}

class _ZoomDrawerScreenState extends State<ZoomDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(
        builder: (context) => DrawerScreen(
          onSelectedItem: (item) {
            setState(() {
              ZoomDrawer.of(context)!.close();
            });
          },
        ),
      ),
      mainScreen: const HomeScreen(),
      angle: 0,
      showShadow: true,
      moveMenuScreen: false,
      slideWidth: MediaQuery.of(context).size.width *
          0.7, //  should be same as menuScreenWidth
      menuScreenWidth: MediaQuery.of(context).size.width *
          0.7, // menuScreenWidth should be same as sideWidth
      androidCloseOnBackTap: true,
      borderRadius: 30,
      menuBackgroundColor: AppColors.drawerBgColor,
      drawerShadowsBackgroundColor: AppColors.lavenderColor,
      mainScreenScale: 0.2,
      mainScreenTapClose: true,
      clipMainScreen: true,
    );
  }
}

class DrawerScreen extends StatelessWidget {
  final ValueChanged<MenuItemData> onSelectedItem;

  DrawerScreen({
    Key? key,
    required this.onSelectedItem,
  }) : super(key: key);

  final signinController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    final userData = signinController.dbUserData;

    return Scaffold(
        backgroundColor: AppColors.drawerBgColor, // bg color of drawer
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(const ProfileScreen());
                          ZoomDrawer.of(context)!.close();
                        },
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              const AssetImage(AppImage.profileIconImg),
                          child: Material(
                            shape: const CircleBorder(),
                            clipBehavior: Clip.hardEdge,
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Get.to(const ProfileScreen());
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () => Text(
                          "${userData.value.firstName ?? "User"} ${userData.value.lastName ?? ""}",
                          style: FontStyle.manrope(20, FontWeight.w800),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () => Text(
                          userData.value.enrollmentNo ?? "",
                          style: FontStyle.manrope(15, FontWeight.w700)
                              .copyWith(color: AppColors.titleColor),
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...MenuItems.all.map(buildMenuItem),
                      ], // list builder of menu item
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    children: [
                      logOutButton(),
                      const SizedBox(width: 10),
                      settingButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Container settingButton() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: AppColors.blackColor,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.to(const SettingScreen());
          },
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: Icon(
            Icons.settings_outlined,
            size: 30,
            color: AppColors.bgColor,
          ),
        ),
      ),
    );
  }

  Container logOutButton() {
    return Container(
      height: 50,
      width: 120,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(50))),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            log("log out pressed");
            signinController.logOut();
          },
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.bgColor,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
                child: Icon(
                  Icons.power_settings_new_outlined,
                  size: 25,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'Log Out',
                style: FontStyle.manrope(16, FontWeight.w700).copyWith(
                  color: AppColors.bgColor,
                ),
              ),
              const SizedBox(width: 5)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(MenuItemData item) => ListTile(
        selectedTileColor:
            Colors.black.withOpacity(0.1), //bg color of selected menu
        selectedColor: AppColors.primaryColor, // color of selected menu
        minLeadingWidth: 20,
        contentPadding: const EdgeInsets.only(left: 25),
        leading: Icon(item.icon),
        title: Text(
          item.title,
          style: FontStyle.manrope(16, FontWeight.w600),
        ),
        onTap: () {
          launchCustomTab(item.url);
        },
      );
}
