// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gtu_app/custome_tab.dart';
import 'package:gtu_app/models/circular_model.dart';
import 'package:gtu_app/style.dart';

class CommonTile extends StatefulWidget {
  final CircularModel dummyCommonCardData;

  const CommonTile({
    Key? key,
    required this.dummyCommonCardData,
  }) : super(key: key);

  @override
  State<CommonTile> createState() => _CommonTileState();
}

class _CommonTileState extends State<CommonTile> {
  final AppColors _colors = AppColors();

  final FontStyle _fontStyle = FontStyle();

  bool isSubtitle = false;

  bool isDate = false;

  @override
  Widget build(BuildContext context) {
    if (widget.dummyCommonCardData.date != null) {
      isDate = true;
    }

    return Container(
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
                ListView.separated(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: widget.dummyCommonCardData.ptags![0].atags!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 5),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () => {
                              launchCustomTab(widget.dummyCommonCardData
                                  .ptags![0].atags![index].link!)
                            },
                        child: Text(
                          "-${widget.dummyCommonCardData.ptags![0].atags![index].atext}",
                          style: _fontStyle.montserrat(15, FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ));
                  },
                ),
              ],
            ),
          ),
          isDate
              ? Text(
                  widget.dummyCommonCardData.date!, //pass subject name
                  style: _fontStyle
                      .manrope(13, FontWeight.w600)
                      .copyWith(color: _colors.titleColor),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
              : const SizedBox(height: 0, width: 0)
        ],
      ),
    );
  }
}
