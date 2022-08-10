import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gtu_app/style/image.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:gtu_app/components/header.dart';
import 'package:gtu_app/components/heading.dart';
import 'package:gtu_app/components/powered_by_astron_apps.dart';
import 'package:gtu_app/data/card_data.dart';
import 'package:gtu_app/style/style.dart';

class PercentageCalculatorScreen extends StatefulWidget {
  const PercentageCalculatorScreen({super.key});

  @override
  State<PercentageCalculatorScreen> createState() =>
      _PercentageCalculatorScreenState();
}

class _PercentageCalculatorScreenState extends State<PercentageCalculatorScreen>
    with TickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  late final animationController = Get.put(AnimationController(vsync: this));

  double spi = 0;
  double percentage = 0;
  bool isValidSPI = false;
  String description =
      'SPI: Semester Performance Index\nCPI: Cumulative Performance Index\nCGPA: Cumulative Grade Point Average\n\nIf duration of course is of 2 years, the degree shall be given to students based upon CPI (Cumulative Performance Index) considering all the four semesters performance.\n\nIf duration of course is of 4 years, the degree shall be given to students based upon CGPA (Cumulative Grade Point Average) considering last four semesters performance.';
  String errorMessage = 'SPI / CPI / CGPA must be between 4 to 10';

  @override
  void initState() {
    super.initState();

    _controller.addListener(_updateText);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateText() {
    setState(() {
      if (_controller.text == '') {
        spi = 0;
      } else {
        spi = double.parse(_controller.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    animationController.duration = const Duration(seconds: 4);
    animationController.reverseDuration = const Duration(seconds: 0);

    if (spi > 10 || spi < 4) {
      isValidSPI = false;
      percentage = 0;

      animationController.reverse();
    } else {
      isValidSPI = true;
      percentage = (spi - 0.5) * 10;
      percentage = double.parse((percentage).toStringAsPrecision(3));

      animationController.forward();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Header(card: percentageCalculator),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: padding,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          spiTextField(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: AnimatedOpacity(
                              opacity: isValidSPI ? 0 : 1,
                              duration: const Duration(milliseconds: 500),
                              child: Text(
                                errorMessage,
                                style: FontStyle.montserrat(14, FontWeight.w600)
                                    .copyWith(color: AppColors.primaryColor),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          progressIndicator(),
                          const SizedBox(
                            height: 40,
                          ),
                          Heading(heading: 'Description'),
                          Text(
                            description,
                            style: FontStyle.montserrat(18, FontWeight.w600),
                          ),
                          PoweredbyAstronApps(),
                        ],
                      ),
                      Positioned(
                        top: 50,
                        right: 0,
                        left: 0,
                        child: Center(
                          child: Lottie.asset(
                            AppAnimation.confettiAnimation,
                            height: 400,
                            controller: animationController,
                          ),
                        ),
                      ),
                      if (spi >= 9 && spi <= 10)
                        Positioned(
                          top: 50,
                          right: 0,
                          left: .0,
                          child: Center(
                            child: Lottie.asset(
                              AppAnimation.trophyAnimation,
                              height: 370,
                              controller: animationController,
                            ),
                          ),
                        ),
                      if (spi >= 7 && spi <= 10)
                        Positioned(
                          top: 50,
                          right: 0,
                          left: .0,
                          child: Center(
                            child: Lottie.asset(
                              AppAnimation.confetti_2Animation,
                              height: 250,
                              controller: animationController,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  spiTextField() {
    return Container(
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: TextField(
            controller: _controller,
            maxLength: 4,
            style: FontStyle.montserrat(16, FontWeight.normal),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
            ],
            decoration: const InputDecoration(
                hintText: "SPI / CPI / CGPA",
                counterText: '',
                border: InputBorder.none),
            keyboardType: TextInputType.number,
          ),
        ));
  }

  progressIndicator() {
    return Center(
      child: CircularPercentIndicator(
        radius: 120,
        lineWidth: 30,
        animation: true,
        percent: percentage / 100,
        animationDuration: 1000,
        backgroundColor: AppColors.percentageCalcBgColor,
        progressColor: AppColors.percentageCalcFillColor,
        circularStrokeCap: CircularStrokeCap.round,
        center: Text(
          '$percentage%',
          style: FontStyle.mPlusRounded1c(40, FontWeight.w500),
        ),
      ),
    );
  }
}
