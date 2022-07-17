import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gtu_app/ScreenRouter.dart';
import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/style.dart';

class RectangleCard extends StatefulWidget {
  final CardData card;

  const RectangleCard({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  State<RectangleCard> createState() => _RectangleCardState();
}

class _RectangleCardState extends State<RectangleCard> {
  final FontStyle _fontStyle = FontStyle();

  final AppColors _colors = AppColors();

  bool istagLine = false;

  bool islinkAvailable = false;

  @override
  Widget build(BuildContext context) {
    if (widget.card.tagline != '') {
      istagLine = true;
    }
    if (widget.card.onTapLink != '') {
      islinkAvailable = true;
    }

    return InkWell(
      onTap: () {
        if (islinkAvailable) {
          print(widget.card.onTapLink);
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScreenRoute(
                        card: widget.card,
                      )));
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 160,
        decoration: BoxDecoration(
            color: widget.card.color,
            borderRadius: const BorderRadius.all(Radius.circular(25))),
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
                      widget.card.title,
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
                            widget.card.tagline,
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
                width: MediaQuery.of(context).size.width * 0.33,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Image.asset(
                    widget.card.image,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
