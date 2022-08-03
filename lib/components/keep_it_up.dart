import 'package:flutter/material.dart';

import 'package:gtu_app/style/style.dart';

class KeepItUp extends StatelessWidget {
  final AppColors _colors = AppColors();
  final FontStyle _fontStyle = FontStyle();

  KeepItUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Keep it up!',
            style: _fontStyle
                .playfairDisplay(100, FontWeight.w900)
                .copyWith(color: _colors.keepitupColor, height: 1.2),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Crafted with ❤️ in Surat.',
            style: _fontStyle
                .manrope(20, FontWeight.normal)
                .copyWith(color: _colors.keepitupColor, letterSpacing: 1),
          ),
        ],
      ),
    );
  }
}
