// ignore_for_file: public_member_api_docs, sort_constructors_first
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
                        istagLine ? 38 : 32, FontWeight.w700),
                  ),
                  SizedBox(
                    height: istagLine ? 5 : 0,
                  ),
                  istagLine
                      ? Text(
                          card.tagline,
                          style: _fontStyle.montserrat(13, FontWeight.w500),
                        )
                      : Text(
                          card.subtitle,
                          style: _fontStyle.montserrat(30, FontWeight.w700),
                        ),
                  SizedBox(
                    height: istagLine ? 10 : 0,
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
