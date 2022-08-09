// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gtu_app/components/custom_loading_indicator.dart';
import 'package:gtu_app/components/header.dart';
import 'package:gtu_app/components/heading.dart';
import 'package:gtu_app/components/powered_by_astron_apps.dart';
import 'package:gtu_app/components/question_paper_tile.dart';
import 'package:gtu_app/components/searchbar.dart';
import 'package:gtu_app/components/syllabus_tile.dart';
import 'package:gtu_app/controllers/papers_controller.dart';
import 'package:gtu_app/controllers/syllabus_controller.dart';
import 'package:gtu_app/data/card_data.dart';
import 'package:gtu_app/models/papers_model.dart';
import 'package:gtu_app/models/syllabus_model.dart';
import 'package:gtu_app/style/image.dart';
import 'package:gtu_app/style/style.dart';

class SearchResultScreen extends StatefulWidget {
  String searchInput;
  SearchResultScreen({
    Key? key,
    required this.searchInput,
  }) : super(key: key);

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final FontStyle _fontStyle = FontStyle();

  final syllabusController = Get.put(SyllabusController());
  final questionPaperController = Get.put(QuestionPaperController());
  final textEditingController = Get.put(TextEditingController());

  @override
  Widget build(BuildContext context) {
    syllabusController.fetchSearchedSyllabus(widget.searchInput);
    questionPaperController.fetchQuestionPaper(widget.searchInput);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
          child: Column(
        children: [
          Header(
            card: searchResultScreen,
          ),
          Padding(
            padding: padding,
            child: SearchBar(
              searchInputController: textEditingController,
              onTap: () {
                syllabusController
                    .fetchSearchedSyllabus(textEditingController.text);

                questionPaperController
                    .fetchQuestionPaper(textEditingController.text);

                FocusManager.instance.primaryFocus?.unfocus();
              },
              onSubmitted: (p0) {
                syllabusController
                    .fetchSearchedSyllabus(textEditingController.text);

                questionPaperController
                    .fetchQuestionPaper(textEditingController.text);

                FocusManager.instance.primaryFocus?.unfocus();
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
                      heading: 'Your subject syllabus',
                    ),
                    syllabusController.obx(
                      (syllabus) => ListView.separated(
                        padding: const EdgeInsets.only(top: 10),
                        itemCount: syllabus.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return SyllabusTile(
                            syllabus: SyllabusModel.fromJson(syllabus[index]),
                          );
                        },
                      ),
                      onLoading: CustomLoadingIndicator(),
                      onError: (error) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            Image.asset(
                              noDataFound,
                              height: 200,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              error!,
                              style: _fontStyle
                                  .manrope(18, FontWeight.w600)
                                  .copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
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
                      onError: (error) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            Image.asset(
                              noDataFound,
                              height: 200,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              error!,
                              style: _fontStyle
                                  .manrope(18, FontWeight.w600)
                                  .copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                            )
                          ],
                        ),
                      ),
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
