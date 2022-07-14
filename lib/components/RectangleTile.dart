// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/style.dart';

class RectangleTile extends StatelessWidget {
  final FontStyle _fontStyle = FontStyle();

  final CardData card;
  bool tagLineFlag;

  RectangleTile({
    Key? key,
    required this.card,
    required this.tagLineFlag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (card.tagline != '') {
      tagLineFlag = true;
    }

    return InkWell(
      onTap: () => {print('Rectangle button pressed')},
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 160,
        decoration: BoxDecoration(
            color: card.color,
            borderRadius: const BorderRadius.all(Radius.circular(25))),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    card.title,
                    style: _fontStyle.montserrat(
                        tagLineFlag ? 40 : 32, FontWeight.w700),
                  ),
                  tagLineFlag
                      ? Text(
                          card.tagline,
                          style: _fontStyle.montserrat(15, FontWeight.w500),
                        )
                      : Text(
                          card.subTitle,
                          style: _fontStyle.montserrat(30, FontWeight.w700),
                        ),
                  SizedBox(
                    height: tagLineFlag ? 10 : 0,
                  )
                ],
              ),
              Image.asset(
                card.image,
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
