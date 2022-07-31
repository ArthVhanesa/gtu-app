import 'package:flutter/material.dart';
import 'package:gtu_app/components/Header.dart';
import 'package:gtu_app/components/Heading.dart';
import 'package:gtu_app/components/PoweredbyAstronApps.dart';
import 'package:gtu_app/components/QuestionPaperTile.dart';
import 'package:gtu_app/components/SearchBar.dart';
import 'package:gtu_app/components/SyllabusTile.dart';
import 'package:gtu_app/controllers/papersController.dart';
import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/data/DummyDataQuestionPaper.dart';
import 'package:gtu_app/style.dart';
import 'package:get/get.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  final questionPaperController = Get.put(QuestionPaperController());
  final controller = Get.put(TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _colors.bgColor,
      body: SafeArea(
          child: Column(
        children: [
          Header(
            card: searchResultScreen,
          ),
          Padding(
            padding: padding,
            child: SearchBar(
              searchInputController: TextEditingController(),
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
                      heading: 'Your subject syllabus',
                    ),
                    //@todo:
                    // SyllabusTile(syllabus: dummyDataQuestionPaper[0]),
                    const SizedBox(
                      height: 40,
                    ),
                    Heading(
                      heading: 'Previous Question Paper',
                    ),
                    questionPaperController.obx(
                      (questionPaper) {
                        return ListView.separated(
                          padding: const EdgeInsets.only(top: 10),
                          itemCount: questionPaper.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemBuilder: (BuildContext context, int index) {
                            return QuestionPaperTile(
                              questionPaper: questionPaper[index],
                            );
                          },
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
