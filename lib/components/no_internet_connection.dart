import 'package:flutter/material.dart';
import 'package:gtu_app/style/image.dart';
import 'package:gtu_app/style/style.dart';
import 'package:lottie/lottie.dart';

class NoInternetConnection extends StatelessWidget {
  NoInternetConnection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(AppAnimation.noInternetAnimation),
        Text(
          'No internet connection. 🥲',
          style: FontStyle.manrope(18, FontWeight.w500),
        ),
        const SizedBox(height: 50)
      ],
    );
  }
}
