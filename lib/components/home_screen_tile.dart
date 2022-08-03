import 'package:flutter/material.dart';

import 'package:gtu_app/components/rectangle_card.dart';
import 'package:gtu_app/components/square_card.dart';
import 'package:gtu_app/data/title_data.dart';
import 'package:gtu_app/style/style.dart';

class HomeScreenTile extends StatelessWidget {
  final HomeScreenTileData tile;
  HomeScreenTile({
    Key? key,
    required this.tile,
  }) : super(key: key);

  final FontStyle _fontStyle = FontStyle();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tile.title,
          style: _fontStyle.montserrat(24, FontWeight.w800),
        ),
        const SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SquareCard(
              card: tile.card1,
            ),
            SquareCard(
              card: tile.card2,
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        RectangleCard(
          card: tile.card3,
        )
      ],
    );
  }
}
