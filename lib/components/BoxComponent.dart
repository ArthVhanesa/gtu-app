// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:gtu_app/components/RectangleTile.dart';
import 'package:gtu_app/components/SquereTile.dart';
import 'package:gtu_app/data/TitleData.dart';
import 'package:gtu_app/style.dart';

class BoxComponent extends StatelessWidget {
  final FontStyle _fontStyle = FontStyle();

  final TileData tileData;
  BoxComponent({
    Key? key,
    required this.tileData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tileData.title,
            style: _fontStyle.montserrat(24, FontWeight.w800),
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SqureTile(
                card: tileData.card1,
              ),
              SqureTile(
                card: tileData.card2,
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          RectangleTile(
            card: tileData.card3,
            tagLineFlag: false,
          )
        ],
      ),
    );
  }
}
