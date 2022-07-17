// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:gtu_app/style.dart';

class ModalBottomColumnFour extends StatelessWidget {
  final FontStyle _fontStyle = FontStyle();

  Color color;
  String title;
  String boxTitle1;
  String boxTitle2;
  String boxTitle3;
  String boxTitle4;
  int boxInt1;
  int boxInt2;
  int boxInt3;
  int boxInt4;

  ModalBottomColumnFour({
    Key? key,
    required this.color,
    required this.title,
    required this.boxTitle1,
    required this.boxTitle2,
    required this.boxTitle3,
    required this.boxTitle4,
    required this.boxInt1,
    required this.boxInt2,
    required this.boxInt3,
    required this.boxInt4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: _fontStyle.montserrat(18, FontWeight.w600),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Box(
              color: color,
              title: boxTitle1,
              number: boxInt1,
            ),
            _Box(
              color: color,
              title: boxTitle2,
              number: boxInt2,
            ),
            _Box(
              color: color,
              title: boxTitle3,
              number: boxInt3,
            ),
            _Box(
              color: color,
              title: boxTitle3,
              number: boxInt3,
            )
          ],
        )
      ],
    );
  }
}

class _Box extends StatelessWidget {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();
  Color color;
  String title;
  int number;
  _Box({
    Key? key,
    required this.color,
    required this.title,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.20,
      height: MediaQuery.of(context).size.width * 0.20,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$number',
            style: _fontStyle
                .montserrat(30, FontWeight.w600)
                .copyWith(color: _colors.titleColor, height: 1),
          ),
          Text(title,
              style: _fontStyle
                  .manrope(12, FontWeight.normal)
                  .copyWith(color: _colors.titleColor))
        ],
      ),
    );
  }
}
