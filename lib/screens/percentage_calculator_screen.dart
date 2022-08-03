import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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

class _PercentageCalculatorScreenState
    extends State<PercentageCalculatorScreen> {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  final TextEditingController _controller = TextEditingController();

  double spi = 0;
  double percentage = 0;
  bool isValidSPI = true;
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
    if (spi > 10 || spi < 4) {
      isValidSPI = false;
      percentage = 0;
    } else {
      isValidSPI = true;
      percentage = (spi - 0.5) * 10;
      percentage = double.parse((percentage).toStringAsPrecision(3));
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _colors.bgColor,
      body: SafeArea(
          child: Column(
        children: [
          Header(card: percentageCalculator),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    spiTextField(),
                    isValidSPI
                        ? const SizedBox(
                            height: 0,
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              errorMessage,
                              style: _fontStyle
                                  .montserrat(16, FontWeight.w600)
                                  .copyWith(color: _colors.primaryColor),
                            ),
                          ),
                    const SizedBox(
                      height: 40,
                    ),
                    progressIndicator(),
                    const SizedBox(
                      height: 40,
                    ),
                    Heading(heading: 'Description'),
                    Text(
                      description,
                      style: _fontStyle.montserrat(18, FontWeight.w600),
                    ),
                    PoweredbyAstronApps(),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  spiTextField() {
    return Container(
        height: 48,
        decoration: BoxDecoration(
          color: _colors.whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: TextField(
            controller: _controller,
            maxLength: 4,
            style: _fontStyle.montserrat(16, FontWeight.normal),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
            ],
            decoration: const InputDecoration(
                hintText: "SPI / CPI / CGPI",
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
        backgroundColor: _colors.percentageCalcBgColor,
        progressColor: _colors.percentageCalcFillColor,
        circularStrokeCap: CircularStrokeCap.round,
        center: Text(
          '${percentage}%',
          style: GoogleFonts.mPlusRounded1c(
              fontSize: 40, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
