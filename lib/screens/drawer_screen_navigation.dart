import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import 'package:gtu_app/controllers/sign_in_controller.dart';
import 'package:gtu_app/data/menu_item_navigation.dart';
import 'package:gtu_app/screens/circular_screen.dart';
import 'package:gtu_app/screens/exam_timetable_screen.dart';
import 'package:gtu_app/screens/home_screen.dart';
import 'package:gtu_app/screens/percentage_calculator_screen.dart';
import 'package:gtu_app/screens/question_paper_screen.dart';
import 'package:gtu_app/screens/result_screen.dart';
import 'package:gtu_app/screens/syllabus_screen.dart';
import 'package:gtu_app/style/image.dart';
import 'package:gtu_app/style/style.dart';

// ============================================================================//
// this is unused drawer screen with navigaion to other screens
// whenever want to navigate to other screen from the drawer use this file
// ============================================================================//
class ZoomDrawerScreenNavigation extends StatefulWidget {
  const ZoomDrawerScreenNavigation({super.key});

  @override
  State<ZoomDrawerScreenNavigation> createState() =>
      _ZoomDrawerScreenNavigationState();
}

class _ZoomDrawerScreenNavigationState
    extends State<ZoomDrawerScreenNavigation> {
  MenuItemData currentItem = MenuItems.Home; // Defalut menu select

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(
        builder: (context) => DrawerScreen(
          currentItem: currentItem,
          onSelectedItem: (item) {
            setState(() {
              currentItem = item;

              ZoomDrawer.of(context)!.close();
            });
          },
        ),
      ),
      mainScreen: getScreen(),
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

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.syllabus:
        return SyllabusScreen();

      case MenuItems.questionPaper:
        return QuestionPaperScreen();

      case MenuItems.result:
        return ResultScreen();

      case MenuItems.percentageCalculator:
        return PercentageCalculatorScreen();

      case MenuItems.circular:
        return CircularScreen();

      case MenuItems.examTimetable:
        return ExamTimetableScreen();

      default:
        return HomeScreen();
    }
  }
}

class DrawerScreen extends StatelessWidget {
  final MenuItemData currentItem;
  final ValueChanged<MenuItemData> onSelectedItem;

  DrawerScreen({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem,
  }) : super(key: key);

  final signinController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
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
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(AppImage.profileIconImg),
                  ),
                  const SizedBox(height: 10),
                  signinController.obx((data) => Text(
                        data.displayName,
                        style: FontStyle.manrope(20, FontWeight.w800),
                      )),
                ],
              ),
            ),
            Column(
              children: [
                ...MenuItems.all.map(buildMenuItem),
              ], // list builder of menu item
            ),
            Container(
              height: 50,
              width: 120,
              margin: EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
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
            )
          ],
        ),
      )),
    );
  }

  Widget buildMenuItem(MenuItemData item) => ListTile(
        selectedTileColor:
            Colors.black.withOpacity(0.1), //bg color of selected menu
        selectedColor: AppColors.primaryColor, // color of selected menu
        selected: currentItem == item,
        minLeadingWidth: 20,
        contentPadding: const EdgeInsets.only(left: 25),
        leading: Icon(item.icon),
        title: Text(
          item.title,
          style: FontStyle.manrope(16, FontWeight.w600),
        ),
        onTap: () {
          onSelectedItem(item);
        },
      );
}
