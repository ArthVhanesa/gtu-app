// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gtu_app/ScreenRouter.dart';
import 'package:gtu_app/custome_tab.dart';
import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/style.dart';
import 'package:get/get.dart';

class SquareCard extends StatelessWidget {
  final CardData card;

  SquareCard({
    Key? key,
    required this.card,
  }) : super(key: key);

  final AppColors _color = AppColors();

  final FontStyle _fontStyle = FontStyle();

  bool islinkAvailable = false;

  @override
  Widget build(BuildContext context) {
    if (card.onTapLink != '') {
      islinkAvailable = true;
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 170,
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
            if (islinkAvailable) {
              launchCustomTab(card.onTapLink);
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ScreenRoute(
                          card: card,
                        )),
              );
            }
          },
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                card.image,
                height: 120,
              ),
              Text(
                card.title,
                style: _fontStyle
                    .montserrat(16, FontWeight.w600)
                    .copyWith(color: _color.titleColor),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
