import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gtu_app/data/card_data.dart';
import 'package:gtu_app/style/style.dart';
import 'package:gtu_app/utils/custome_tab.dart';
import 'package:gtu_app/utils/screen_router.dart';

class RectangleCard extends StatelessWidget {
  final CardData card;

  RectangleCard({
    Key? key,
    required this.card,
  }) : super(key: key);

  bool istagLine = false;

  bool islinkAvailable = false;

  @override
  Widget build(BuildContext context) {
    if (card.tagline != '') {
      istagLine = true;
    }
    if (card.onTapLink != '') {
      islinkAvailable = true;
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      // width: 290,
      height: 160,
      decoration: BoxDecoration(
        color: card.color,
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.closeCurrentSnackbar();
            if (islinkAvailable) {
              launchCustomTab(card.onTapLink);
            } else {
              Get.to(() => ScreenRoute(card: card));
            }
          },
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        card.title,
                        style: FontStyle.montserrat(32, FontWeight.w700)
                            .copyWith(color: AppColors.titleColor),
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: istagLine ? 5 : 0,
                      ),
                      istagLine
                          ? AutoSizeText(
                              card.tagline,
                              style: FontStyle.montserrat(15, FontWeight.w600)
                                  .copyWith(color: AppColors.titleColor),
                              maxLines: 1,
                            )
                          : const SizedBox(height: 0),
                      // SizedBox(
                      //   height: istagLine ? 10 : 0,
                      // )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.32,
                  child: Image.asset(
                    card.image,
                    height: 150,
                    gaplessPlayback: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
