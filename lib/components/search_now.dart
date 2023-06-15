// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:gtu_app/style/image.dart';
import 'package:gtu_app/style/style.dart';

class SearchNow extends StatelessWidget {
  final String message;
  const SearchNow({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Image.asset(
            AppImage.searchImg,
            height: 200,
          ),
          const SizedBox(height: 15),
          Text(
            message,
            style: FontStyle.manrope(18, FontWeight.w600).copyWith(
              color: AppColors.primaryColor,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
