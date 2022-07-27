// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gtu_app/image.dart';
import 'package:gtu_app/style.dart';

class SnackBarType {
  Color color;
  String image;
  SnackBarType({
    required this.color,
    required this.image,
  });

  final AppColors _colors = AppColors();

  static SnackBarType error =
      SnackBarType(color: Color(0xFFFFCFCF), image: errorImg);
  static SnackBarType warning =
      SnackBarType(color: Color(0xFFFFF9BF), image: warningImg);
}

class CustomSnackBar extends StatelessWidget {
  final FontStyle _fontStyle = FontStyle();
  final AppColors _colors = AppColors();

  String title;
  String message;
  SnackBarType snackBarType;

  CustomSnackBar({
    Key? key,
    required this.title,
    required this.message,
    required this.snackBarType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 16, 10),
      height: 90,
      decoration: BoxDecoration(
          color: snackBarType.color,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 7,
              offset: Offset(0, 4),
            )
          ]),
      child: Row(
        children: [
          Image.asset(
            snackBarType.image,
            height: 90,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: _fontStyle
                      .manrope(18, FontWeight.w600)
                      .copyWith(color: _colors.blackColor),
                ),
                Text(
                  message,
                  style: _fontStyle
                      .manrope(12, FontWeight.w500)
                      .copyWith(color: _colors.blackColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
