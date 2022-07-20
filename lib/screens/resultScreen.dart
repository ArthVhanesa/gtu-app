import 'package:flutter/material.dart';
import 'package:gtu_app/components/CommonTile.dart';
import 'package:gtu_app/components/Header.dart';
import 'package:gtu_app/components/Heading.dart';
import 'package:gtu_app/components/PoweredbyAstronApps.dart';
import 'package:gtu_app/components/SquareCard.dart';
import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/data/DummyCommonCardData.dart';
import 'package:gtu_app/style.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final AppColors _colors = AppColors();

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
                  Heading(heading: 'Result announcement'),
                  ListView.separated(
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: dummyCommonCardData.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (BuildContext context, int index) {
                      return CommonTile(
                        dummyCommonCardData: dummyCommonCardData[index],
                      );
                    },
                  ),
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
