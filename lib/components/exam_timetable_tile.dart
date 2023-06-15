import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gtu_app/models/timetable_model.dart';
import 'package:gtu_app/style/style.dart';

class ExamTimetableTile extends StatelessWidget {
  TimeTableModel data;

  ExamTimetableTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 105,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.questionPaperTileColor,
          borderRadius: const BorderRadius.all(Radius.circular(25))),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.20,
            decoration: BoxDecoration(
                color: AppColors.bgColor,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.date!.substring(0, 2),
                  style: FontStyle.manrope(28, FontWeight.w700),
                ),
                Text(
                  data.date!.substring(3, 11),
                  style: FontStyle.manrope(11, FontWeight.w600),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AutoSizeText(
                  '${data.subcode}',
                  style: FontStyle.montserrat(15, FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                AutoSizeText(
                  data.subname ?? "",
                  style: FontStyle.montserrat(15, FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                AutoSizeText(
                  data.time ?? "",
                  style: FontStyle.montserrat(15, FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
