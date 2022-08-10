import 'package:flutter/material.dart';

import 'package:gtu_app/style/style.dart';

class ModalBottomColumnThree extends StatelessWidget {
  final Color color;
  final String title;
  final String boxTitle1;
  final String boxTitle2;
  final String boxTitle3;
  final String boxInt1;
  final String boxInt2;
  final String boxInt3;

  ModalBottomColumnThree({
    Key? key,
    required this.color,
    required this.title,
    required this.boxTitle1,
    required this.boxTitle2,
    required this.boxTitle3,
    required this.boxInt1,
    required this.boxInt2,
    required this.boxInt3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: FontStyle.montserrat(18, FontWeight.w600),
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
            )
          ],
        )
      ],
    );
  }
}

class _Box extends StatefulWidget {
  final Color color;
  final String title;
  final String number;
  const _Box({
    Key? key,
    required this.color,
    required this.title,
    required this.number,
  }) : super(key: key);

  @override
  State<_Box> createState() => _BoxState();
}

class _BoxState extends State<_Box> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
          color: widget.color,
          borderRadius: const BorderRadius.all(Radius.circular(25))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${widget.number}',
            style: FontStyle.montserrat(40, FontWeight.w600)
                .copyWith(color: AppColors.titleColor, height: 1),
          ),
          Text(widget.title,
              style: FontStyle.manrope(15, FontWeight.normal)
                  .copyWith(color: AppColors.titleColor))
        ],
      ),
    );
  }
}
