import 'package:flutter/material.dart';

import 'package:gtu_app/style/style.dart';

class Heading extends StatelessWidget {
  final String heading;

  Heading({
    Key? key,
    required this.heading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 20),
      child: Row(
        children: [
          Text(
            heading,
            style: FontStyle.montserrat(18, FontWeight.w600),
          ),
          const SizedBox(
            width: 15,
          ),
          Dot(
            size: 8,
          )
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double size;

  Dot({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration:
          BoxDecoration(color: AppColors.primaryColor, shape: BoxShape.circle),
    );
  }
}
