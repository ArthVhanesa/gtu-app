import 'package:flutter/material.dart';

import 'package:gtu_app/data/card_data.dart';
import 'package:gtu_app/style/style.dart';
import 'package:gtu_app/utils/custome_tab.dart';
import 'package:gtu_app/utils/screen_router.dart';

class SquareCard extends StatelessWidget {
  final CardData card;

  SquareCard({
    Key? key,
    required this.card,
  }) : super(key: key);

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
                gaplessPlayback: true,
              ),
              Text(
                card.title,
                style: _fontStyle
                    .montserrat(16, FontWeight.w600)
                    .copyWith(color: AppColors.titleColor),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
