import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gtu_app/components/Header.dart';
import 'package:gtu_app/components/Heading.dart';
import 'package:gtu_app/components/PoweredbyAstronApps.dart';
import 'package:gtu_app/components/SearchBar.dart';
import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/style.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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

  var spi;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateText);
  }

  void _updateText() {
    setState(() {
      spi = _controller.text;
    });
  }

  String description =
      'SPI: Semester Performance Index\nCPI: Cumulative Performance Index\nCGPA: Cumulative Grade Point Average\n\nIf duration of course is of 2 years, the degree shall be given to students based upon CPI (Cumulative Performance Index) considering all the four semesters performance.\n\nIf duration of course is of 4 years, the degree shall be given to students based upon CGPA (Cumulative Grade Point Average) considering last four semesters performance.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

  progressIndicator() {
    // double test = double.tryParse(_controller.text);

    double percentage = 100 / 100;

    return Center(
      child: CircularPercentIndicator(
        radius: 120,
        lineWidth: 30,
        animation: true,
        percent: percentage,
        animationDuration: 1000,
        backgroundColor: _colors.percentageCalcBgColor,
        progressColor: _colors.percentageCalcFillColor,
        circularStrokeCap: CircularStrokeCap.round,
        center: Text(
          spi,
          style: GoogleFonts.mPlusRounded1c(
              fontSize: 40, fontWeight: FontWeight.w500),
        ),
      ),
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
            maxLength: 2,
            style: _fontStyle.montserrat(16, FontWeight.normal),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp("[0-9]"))
            ],
            decoration: const InputDecoration(
                hintText: "SPI / CPI / CGPI",
                counterText: '',
                border: InputBorder.none),
            keyboardType: TextInputType.number,
          ),
        ));
  }
}
