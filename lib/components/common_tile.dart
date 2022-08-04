import 'package:flutter/material.dart';

import 'package:gtu_app/models/circular_model.dart';
import 'package:gtu_app/style/style.dart';
import 'package:gtu_app/utils/launch_tab.dart';

class CommonTile extends StatefulWidget {
  final CircularModel commonCardData;

  const CommonTile({
    Key? key,
    required this.commonCardData,
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
    if (widget.commonCardData.date != null) {
      isDate = true;
    }

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
          onTap: () => {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: _colors.bgColor,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15))),
                builder: (context) => ModalBottomSheet(
                      commonCardData: widget.commonCardData,
                    ))
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
                      ListView.separated(
                        itemCount:
                            widget.commonCardData.ptags![0].atags!.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 5),
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            "• ${widget.commonCardData.ptags![0].atags![index].atext}",
                            style: _fontStyle.montserrat(15, FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                isDate
                    ? Text(
                        widget.commonCardData.date!, //pass subject name
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
        ),
      ),
    );
  }
}

class ModalBottomSheet extends StatefulWidget {
  final CircularModel commonCardData;
  const ModalBottomSheet({
    Key? key,
    required this.commonCardData,
  }) : super(key: key);

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  bool isDate = false;
  @override
  Widget build(BuildContext context) {
    if (widget.commonCardData.date != null) {
      isDate = true;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        Container(
          width: 40,
          height: 5,
          decoration: BoxDecoration(
            color: _colors.titleColor,
            borderRadius: const BorderRadius.all(Radius.circular(25)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Circular',
                      style: _fontStyle.montserrat(20, FontWeight.w600),
                    ),
                    isDate
                        ? Text(
                            'Date: ${widget.commonCardData.date!}',
                            style: _fontStyle.manrope(16, FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          )
                        : const SizedBox(height: 0)
                  ],
                ),
              ),
              const Icon(
                Icons.campaign_outlined,
                size: 30,
              )
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: _colors.blackColor,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListView.separated(
                itemCount: widget.commonCardData.ptags![0].atags!.length,
                // itemCount: 1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "• ${widget.commonCardData.ptags![0].atags![index].atext}",
                          style: _fontStyle.manrope(15, FontWeight.w600),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: _colors.linkBlueBgColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            onTap: () {
                              launchTab(widget.commonCardData.ptags![0]
                                  .atags![index].link!);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: Center(
                                child: Text(
                                  'View',
                                  style: _fontStyle
                                      .montserrat(15, FontWeight.w500)
                                      .copyWith(
                                        color: _colors.linkBlueColor,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
