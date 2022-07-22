import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gtu_app/image.dart';
import 'package:gtu_app/screens/homeScreen.dart';
import 'package:gtu_app/style.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroductionScreens extends StatefulWidget {
  IntroductionScreens({super.key});

  @override
  State<IntroductionScreens> createState() => _IntroductionScreensState();
}

class _IntroductionScreensState extends State<IntroductionScreens> {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  final controller = PageController();
  bool isLastPage = false;
  bool isFirstPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            isLastPage = index == 3;
            isFirstPage = index == 0;
          });
        },
        children: [
          buildPage(
            color: _colors.lavenderColor,
            title: 'Get notifications when there’s a case',
            body:
                'A notification will be sent to all students along with an incident report.',
            image: syllabusImg,
          ),
          buildPage(
            color: _colors.lightMossGreenColor,
            title: 'Get notifications when there’s a case',
            body:
                'A notification will be sent to all students along with an incident report.',
            image: syllabusImg,
          ),
          buildPage(
            color: _colors.orangeColor,
            title: 'Get notifications when there’s a case',
            body:
                'A notification will be sent to all students along with an incident report.',
            image: syllabusImg,
          ),
          buildPage(
            color: _colors.skyBlueColor,
            title: 'Get notifications when there’s a case',
            body:
                'A notification will be sent to all students along with an incident report.',
            image: syllabusImg,
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 80, // height should be equal to padding of bottom
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isFirstPage ? const SizedBox(width: 0) : backButton(),
            isLastPage ? launchAppButton() : nextButton()
          ],
        ),
      ),
    );
  }

  Container buildPage(
      {required Color color,
      required String title,
      required String body,
      required String image}) {
    return Container(
      color: color,
      padding: const EdgeInsets.fromLTRB(25, 0, 25,
          80), // bottom padding should be equal to height of the bottomSheet
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Image.asset(
                image,
                height: 260,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: _fontStyle.manrope(32, FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  body,
                  style: _fontStyle
                      .manrope(22, FontWeight.w600)
                      .copyWith(color: _colors.titleColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InkWell launchAppButton() {
    return InkWell(
      onTap: () async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('showHome', true);

        Get.off(HomeScreen());
      },
      child: Container(
        width: 160,
        height: 60,
        decoration: BoxDecoration(
            color: _colors.blackColor,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Center(
          child: Text(
            'Launch App',
            style: _fontStyle
                .manrope(20, FontWeight.w600)
                .copyWith(color: _colors.whiteColor),
          ),
        ),
      ),
    );
  }

  InkWell nextButton() {
    return InkWell(
      onTap: () {
        controller.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      },
      child: Container(
        width: 125,
        height: 60,
        decoration: BoxDecoration(
            color: _colors.blackColor,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Next',
              style: _fontStyle
                  .manrope(20, FontWeight.w600)
                  .copyWith(color: _colors.whiteColor),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  IconButton backButton() {
    return IconButton(
      splashRadius: 20,
      iconSize: 25,
      onPressed: () {
        controller.previousPage(
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      },
      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }
}
