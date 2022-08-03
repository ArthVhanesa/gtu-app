import 'package:flutter/material.dart';

import 'package:gtu_app/components/header.dart';
import 'package:gtu_app/components/powered_by_astron_apps.dart';
import 'package:gtu_app/components/square_card.dart';
import 'package:gtu_app/data/card_data.dart';
import 'package:gtu_app/style/style.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colors.bgColor,
      body: SafeArea(
          child: Column(
        children: [
          Header(card: result),
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: padding,
              child: Column(
                children: [
                  Wrap(spacing: 20, runSpacing: 20, children: [
                    SquareCard(card: resultTile),
                    SquareCard(card: midMarks),
                    SquareCard(card: gradeHistory),
                    SquareCard(card: percentageCalculator),
                  ]),
                  const SizedBox(height: 40),
                  // Heading(heading: 'Result announcement'),
                  // ListView.separated(
                  //   padding: const EdgeInsets.only(top: 10),
                  //   itemCount: dummyCommonCardData.length,
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   separatorBuilder: (context, index) =>
                  //       const SizedBox(height: 10),
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return CommonTile(
                  //       dummyCommonCardData: dummyCommonCardData[index],
                  //     );
                  //   },
                  // ),
                  PoweredbyAstronApps()
                ],
              ),
            ),
          ))
        ],
      )),
    );
  }
}
