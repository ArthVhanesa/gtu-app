import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gtu_app/data/card_data.dart';
import 'package:gtu_app/provider/globals.dart';
import 'package:gtu_app/style/style.dart';
import 'package:gtu_app/utils/custome_tab.dart';

class Header extends StatefulWidget {
  final CardData card;

  const Header({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool ispageSubtitle = false;

  bool ispageLink = false;

  @override
  Widget build(BuildContext context) {
    if (widget.card.pageSubtitle != '') {
      ispageSubtitle = true;
    }
    if (widget.card.pageLink != '') {
      ispageLink = true;
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 160,
      // decoration: BoxDecoration(color: AppColors.lightGreenColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new),
                      onPressed: () {
                        AppGlobals.rootScaffoldMessengerKey.currentState!
                            .removeCurrentSnackBar();
                        Get.back();
                      },
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        widget.card.pageTitle,
                        style: FontStyle.montserrat(25, FontWeight.w700),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
                ispageSubtitle
                    ? Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        margin: const EdgeInsets.only(left: 48),
                        child: Text(
                          widget.card.pageSubtitle,
                          style: FontStyle.montserrat(15, FontWeight.w700),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      )
                    : const SizedBox(height: 0),
                ispageLink
                    ? Padding(
                        padding: const EdgeInsets.only(top: 25, left: 24),
                        child: TextButton(
                          onPressed: () {
                            launchCustomTab(widget.card.pageLink);
                          },
                          style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                          child: Text(
                            'Official Website 🔗',
                            style: FontStyle.montserrat(15, FontWeight.normal)
                                .copyWith(color: AppColors.linkBlueColor),
                          ),
                        ),
                      )
                    : const SizedBox(
                        height: 0,
                      )
              ],
            ),
          ),
          Image.asset(
            widget.card.image,
            // height: MediaQuery.of(context).size.width * 0.35,
            height: 120,
            gaplessPlayback: true,
          )
        ],
      ),
    );
  }
}
