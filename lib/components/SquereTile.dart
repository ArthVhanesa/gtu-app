// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gtu_app/components/KeepItUp.dart';
import 'package:gtu_app/data/CardData.dart';
import 'package:gtu_app/screens/logIn.dart';
import 'package:gtu_app/style.dart';

class SqureTile extends StatelessWidget {
  final AppColors _color = AppColors();
  final FontStyle _fontStyle = FontStyle();

  final CardData card;

  SqureTile({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LogInScreen())),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: 170,
        decoration: BoxDecoration(
            color: card.color,
            borderRadius: const BorderRadius.all(Radius.circular(25))),
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
    );
  }
}
