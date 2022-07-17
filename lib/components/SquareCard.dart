// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gtu_app/ScreenRouter.dart';
import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/style.dart';

class SquareCard extends StatefulWidget {
  final CardData card;

  const SquareCard({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  State<SquareCard> createState() => _SquareCardState();
}

class _SquareCardState extends State<SquareCard> {
  final AppColors _color = AppColors();

  final FontStyle _fontStyle = FontStyle();

  bool islinkAvailable = false;

  @override
  Widget build(BuildContext context) {
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
        width: MediaQuery.of(context).size.width * 0.4,
        height: 170,
        decoration: BoxDecoration(
            color: widget.card.color,
            borderRadius: const BorderRadius.all(Radius.circular(25))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.card.image,
              height: 120,
            ),
            Text(
              widget.card.title,
              style: _fontStyle
                  .montserrat(16, FontWeight.w600)
                  .copyWith(color: _color.titleColor),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
