import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gtu_app/models/papers_model.dart';
import 'package:gtu_app/style/style.dart';
import 'package:gtu_app/utils/pdf_viewer.dart';

class QuestionPaperTile extends StatelessWidget {
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
        color: AppColors.questionPaperTileColor,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          onTap: () async {
            Get.to(() => PdfViewer(url: "${questionPaper.pdflink}"));
            FocusManager.instance.primaryFocus?.unfocus();
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
