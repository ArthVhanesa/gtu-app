import 'package:flutter/material.dart';
import 'package:gtu_app/components/Header.dart';
import 'package:gtu_app/components/Heading.dart';
import 'package:gtu_app/components/PoweredbyAstronApps.dart';
import 'package:gtu_app/components/QuestionPaperTile.dart';
import 'package:gtu_app/components/SearchBar.dart';
import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/data/DummyDataQuestionPaper.dart';
import 'package:gtu_app/style.dart';

class QuestionPaperScreen extends StatefulWidget {
  const QuestionPaperScreen({super.key});

  @override
  State<QuestionPaperScreen> createState() => _QuestionPaperScreenState();
}

class _QuestionPaperScreenState extends State<QuestionPaperScreen> {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _colors.bgColor,
      body: SafeArea(
          child: Column(
        children: [
          Header(
            card: questionPaper,
          ),
          Padding(
            padding: padding,
            child: SearchBar(
              onTap: () {},
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: padding,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Heading(
                      heading: 'Previous Question Paper',
                    ),
                    ListView.separated(
                      padding: const EdgeInsets.only(top: 10),
                      itemCount: dummyDataQuestionPaper.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemBuilder: (BuildContext context, int index) {
                        return QuestionPaperTile(
                          questionPaper: dummyDataQuestionPaper[index],
                        );
                      },
                    ),
                    PoweredbyAstronApps()
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
