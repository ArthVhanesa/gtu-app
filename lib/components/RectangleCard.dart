import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gtu_app/ScreenRouter.dart';
import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/style.dart';

class RectangleCard extends StatelessWidget {
  final CardData card;

  RectangleCard({
    Key? key,
    required this.card,
  }) : super(key: key);

  final FontStyle _fontStyle = FontStyle();

  final AppColors _colors = AppColors();

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

    return InkWell(
      onTap: () {
        if (islinkAvailable) {
          print(card.onTapLink);
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScreenRoute(
                        card: card,
                      )));
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        // width: 290,
        padding: const EdgeInsets.only(left: 20, right: 5),
        height: 160,
        decoration: BoxDecoration(
            color: card.color,
            borderRadius: const BorderRadius.all(Radius.circular(25))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              // width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    card.title,
                    style: _fontStyle
                        .montserrat(32, FontWeight.w700)
                        .copyWith(color: _colors.titleColor),
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: istagLine ? 5 : 0,
                  ),
                  istagLine
                      ? AutoSizeText(
                          card.tagline,
                          style: _fontStyle
                              .montserrat(15, FontWeight.w600)
                              .copyWith(color: _colors.titleColor),
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
              width: MediaQuery.of(context).size.width * 0.35,
              child: Image.asset(
                card.image,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
