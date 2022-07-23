import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gtu_app/data/IntroductionScreenData.dart';
import 'package:gtu_app/screens/homeScreen.dart';
import 'package:gtu_app/style.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroductionScreens extends StatefulWidget {
  const IntroductionScreens({super.key});

  @override
  State<IntroductionScreens> createState() => _IntroductionScreensState();
}

class _IntroductionScreensState extends State<IntroductionScreens> {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();
  final List<IntroductionScreenData> _screen = introductionScreenData;
  final totalIntroScreen = introductionScreenData.length;

  final controller = PageController();
  bool isLastPage = false;
  bool isFirstPage = true;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const BouncingScrollPhysics(),
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            isLastPage = index == 3;
            isFirstPage = index == 0;
          });
        },
        children: [
          for (int i = 0; i < totalIntroScreen; i++)
            buildPage(screen: _screen[i])
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 80, // height should be equal to padding of bottom
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isFirstPage ? const SizedBox(width: 0) : backButton(),
            isLastPage ? launchAppButton() : const SizedBox(width: 0),
            isLastPage
                ? const SizedBox(
                    width:
                        25) // Width of the sized box should be equal to the size of the backButton
                : nextButton(),
          ],
        ),
      ),
    );
  }

  Container buildPage({
    required IntroductionScreenData screen,
  }) {
    return Container(
      color: screen.color,
      padding: const EdgeInsets.fromLTRB(25, 0, 25,
          80), // bottom padding should be equal to height of the bottomSheet
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Image.asset(
                screen.image,
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
                  screen.title,
                  style: _fontStyle.manrope(32, FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  screen.body,
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

  launchAppButton() {
    return Container(
      width: 160,
      height: 60,
      decoration: BoxDecoration(
          color: _colors.blackColor,
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          onTap: () async {
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('showHome', true);

            Get.off(HomeScreen());
          },
          child: Center(
            child: Text(
              'Launch App',
              style: _fontStyle
                  .manrope(20, FontWeight.w600)
                  .copyWith(color: _colors.whiteColor),
            ),
          ),
        ),
      ),
    );
  }

  nextButton() {
    return Container(
      width: 125,
      height: 60,
      decoration: BoxDecoration(
        color: _colors.blackColor,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          onTap: () {
            controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
          },
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
              Icon(
                Icons.arrow_forward,
                color: _colors.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  backButton() {
    return InkResponse(
      containedInkWell: false,
      splashColor: Colors.white,
      radius: 20,
      onTap: () {
        controller.previousPage(
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      },
      child: const Icon(
        Icons.arrow_back,
        size: 25,
      ),
    );
  }
}
