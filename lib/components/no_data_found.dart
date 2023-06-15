import 'package:flutter/material.dart';
import 'package:gtu_app/style/image.dart';
import 'package:gtu_app/style/style.dart';

class NoDataFound extends StatelessWidget {
  final String? error;
  const NoDataFound({
    Key? key,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Image.asset(
            AppImage.noDataFoundImg,
            height: 200,
          ),
          const SizedBox(height: 15),
          Text(
            error!,
            style: FontStyle.manrope(18, FontWeight.w600).copyWith(
              color: AppColors.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
