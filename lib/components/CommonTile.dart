// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:gtu_app/data/DummyCommonCardData.dart';
import 'package:gtu_app/style.dart';

class CommonTile extends StatelessWidget {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();
  DummyCommonCardData dummyCommonCardData;

  CommonTile({
    Key? key,
    required this.dummyCommonCardData,
  }) : super(key: key);

  bool isSubtitle = false;
  bool isDate = false;

  @override
  Widget build(BuildContext context) {
    if (dummyCommonCardData.subtitle != '') {
      isSubtitle = true;
    }
    if (dummyCommonCardData.date != '') {
      isDate = true;
    }

    return InkWell(
      onTap: () => {},
      child: Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: _colors.questionPaperTileColor,
            borderRadius: const BorderRadius.all(Radius.circular(25))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dummyCommonCardData.title, //pass subject code
                    style: _fontStyle.montserrat(15, FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  ),
                  isSubtitle
                      ? Text(
                          dummyCommonCardData.subtitle, //pass subject name
                          style: _fontStyle.manrope(13, FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )
                      : const SizedBox(height: 0)
                ],
              ),
            ),
            isDate
                ? Text(
                    dummyCommonCardData.date, //pass subject name
                    style: _fontStyle
                        .manrope(13, FontWeight.w600)
                        .copyWith(color: _colors.titleColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )
                : const SizedBox(height: 0, width: 0)
          ],
        ),
      ),
    );
  }
}
