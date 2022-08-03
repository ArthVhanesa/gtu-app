import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gtu_app/components/header.dart';
import 'package:gtu_app/components/heading.dart';
import 'package:gtu_app/components/powered_by_astron_apps.dart';
import 'package:gtu_app/components/question_paper_tile.dart';
import 'package:gtu_app/components/searchbar.dart';
import 'package:gtu_app/controllers/papers_controller.dart';
import 'package:gtu_app/data/card_data.dart';
import 'package:gtu_app/style/style.dart';

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
              onSubmitted: (p0) {},
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
