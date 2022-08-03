import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'package:gtu_app/style/style.dart';

class CustomLoadingIndicator extends StatelessWidget {
  CustomLoadingIndicator({
    Key? key,
  }) : super(key: key);

  final AppColors _colors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60), // padding of indicator
      child: Center(
        child: Container(
          height: 80, // size of indicator
          child: LoadingIndicator(
            indicatorType: Indicator.ballClipRotateMultiple,
            colors: [_colors.primaryColor], // color of incdicator
          ),
        ),
      ),
    );
  }
}
