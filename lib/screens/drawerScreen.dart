// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:gtu_app/controllers/signInController.dart';
import 'package:gtu_app/custome_tab.dart';
import 'package:gtu_app/data/MenuItem.dart';
import 'package:gtu_app/image.dart';
import 'package:gtu_app/screens/homeScreen.dart';
import 'package:gtu_app/screens/profileScreen.dart';
import 'package:gtu_app/screens/settingScreen.dart';
import 'package:gtu_app/style.dart';

class ZoomDrawerScreen extends StatefulWidget {
  const ZoomDrawerScreen({super.key});

  @override
  State<ZoomDrawerScreen> createState() => _ZoomDrawerScreenState();
}

class _ZoomDrawerScreenState extends State<ZoomDrawerScreen> {
  final AppColors _colors = AppColors();

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
      menuBackgroundColor: _colors.drawerBgColor,
      drawerShadowsBackgroundColor: _colors.lavenderColor,
      mainScreenScale: 0.2,
      mainScreenTapClose: true,
      clipMainScreen: true,
    );
  }
}

class DrawerScreen extends StatelessWidget {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  final ValueChanged<MenuItemData> onSelectedItem;

  DrawerScreen({
    Key? key,
    required this.onSelectedItem,
  }) : super(key: key);

  final signinController = Get.put(SignInController());
  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: rootScaffoldMessengerKey,
      child: Scaffold(
          backgroundColor: _colors.drawerBgColor, // bg color of drawer
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
                            backgroundImage: const AssetImage(profileIconImg),
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
                        signinController.obx(
                          (data) => Text(
                            data.displayName ?? "",
                            style: _fontStyle.manrope(20, FontWeight.w800),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "{Enrollment no.}",
                          style:
                              _fontStyle.manrope(15, FontWeight.w700).copyWith(
                                    color: _colors.titleColor,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      ...MenuItems.all.map(buildMenuItem),
                    ], // list builder of menu item
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
          )),
    );
  }

  Container settingButton() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: _colors.blackColor,
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
            color: _colors.bgColor,
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
          color: _colors.primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(50))),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            signinController.logOut();
          },
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: _colors.bgColor,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
                child: Icon(
                  Icons.power_settings_new_outlined,
                  size: 25,
                  color: _colors.primaryColor,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'Log Out',
                style: _fontStyle.manrope(16, FontWeight.w700).copyWith(
                      color: _colors.bgColor,
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
        selectedColor: _colors.primaryColor, // color of selected menu
        minLeadingWidth: 20,
        contentPadding: const EdgeInsets.only(left: 25),
        leading: Icon(item.icon),
        title: Text(
          item.title,
          style: _fontStyle.manrope(16, FontWeight.w600),
        ),
        onTap: () {
          launchCustomTab(item.url);
        },
      );
}
