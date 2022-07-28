import 'package:flutter/material.dart';

import 'package:gtu_app/data/DummyDataQuestionPaper.dart';
import 'package:gtu_app/style.dart';

class QuestionPaperTile extends StatelessWidget {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();
  DummyDataQuestionPaper questionPaper;

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
          onTap: () {},
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
                        "${questionPaper.subCode} (${questionPaper.previous})", //pass subject code
                        style: _fontStyle.montserrat(16, FontWeight.w600),
                      ),
                      Text(
                        questionPaper.subName, //pass subject name
                        style: _fontStyle.manrope(13, FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )
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
