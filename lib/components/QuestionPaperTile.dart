import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gtu_app/data/DummyDataQuestionPaper.dart';
import 'package:gtu_app/models/papers_model.dart';
import 'package:gtu_app/pdf_viewer.dart';
import 'package:gtu_app/style.dart';

class QuestionPaperTile extends StatelessWidget {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();
  QuestionPaperModel questionPaper;

  QuestionPaperTile({
    Key? key,
    required this.questionPaper,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: _colors.questionPaperTileColor,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          onTap: () async {
            Get.to(PdfViewer(url: "${questionPaper.pdflink}"));
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${questionPaper.subcode} (${questionPaper.session})", //pass subject code
                        style: _fontStyle.montserrat(16, FontWeight.w600),
                      ),
                      // Text(
                      //   "questionPaper.subcode", //pass subject name
                      //   style: _fontStyle.manrope(13, FontWeight.w600),
                      //   overflow: TextOverflow.ellipsis,
                      //   maxLines: 2,
                      // )
                    ],
                  ),
                ),
                const Icon(
                  Icons.description,
                  size: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
