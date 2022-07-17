import 'package:flutter/material.dart';
import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/style.dart';

class Header extends StatelessWidget {
  final CardData card;

  Header({
    Key? key,
    required this.card,
  }) : super(key: key);

  bool ispageSubtitle = false;
  bool ispageLink = false;

  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  @override
  Widget build(BuildContext context) {
    if (card.pageSubtitle != '') {
      ispageSubtitle = true;
    }
    if (card.pageLink != '') {
      ispageLink = true;
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 160,
      // decoration: BoxDecoration(color: _colors.lightGreenColor),
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
                        Navigator.pop(context);
                      },
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        card.pageTitle,
                        style: _fontStyle.montserrat(25, FontWeight.w700),
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
                          card.pageSubtitle,
                          style: _fontStyle.montserrat(15, FontWeight.w700),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      )
                    : const SizedBox(height: 0),
                ispageLink
                    ? Padding(
                        padding: const EdgeInsets.only(top: 25, left: 24),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                          child: Text(
                            'Official Website 🔗',
                            style: _fontStyle
                                .montserrat(15, FontWeight.normal)
                                .copyWith(color: _colors.linkBlueColor),
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
            card.image,
            // height: MediaQuery.of(context).size.width * 0.35,
            height: 120,
          )
        ],
      ),
    );
  }
}
