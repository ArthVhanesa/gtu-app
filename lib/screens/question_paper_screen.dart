import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gtu_app/components/custom_loading_indicator.dart';
import 'package:gtu_app/components/header.dart';
import 'package:gtu_app/components/heading.dart';
import 'package:gtu_app/components/powered_by_astron_apps.dart';
import 'package:gtu_app/components/question_paper_tile.dart';
import 'package:gtu_app/components/searchbar.dart';
import 'package:gtu_app/controllers/papers_controller.dart';
import 'package:gtu_app/data/card_data.dart';
import 'package:gtu_app/models/papers_model.dart';
import 'package:gtu_app/style/style.dart';

class QuestionPaperScreen extends StatefulWidget {
  const QuestionPaperScreen({super.key});

  @override
  State<QuestionPaperScreen> createState() => _QuestionPaperScreenState();
}

class _QuestionPaperScreenState extends State<QuestionPaperScreen> {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  final questionPaperController = Get.put(QuestionPaperController());
  final TextEditingController questionPaperInputController =
      TextEditingController();

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
              searchInputController: questionPaperInputController,
              onTap: () {
                questionPaperController
                    .fetchQuestionPaper(questionPaperInputController.text);
                FocusScope.of(context).unfocus();
              },
              onSubmitted: (value) {
                questionPaperController.fetchQuestionPaper(value);
                FocusScope.of(context).unfocus();
              },
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
                    questionPaperController.obx(
                      (questionPaper) {
                        return ListView.separated(
                          padding: const EdgeInsets.only(top: 10),
                          itemCount: questionPaper.length, //length
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemBuilder: (BuildContext context, int index) {
                            return QuestionPaperTile(
                              questionPaper: QuestionPaperModel.fromJson(
                                  questionPaper[index]),
                            );
                          },
                        );
                      },
                      onLoading: CustomLoadingIndicator(),
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