import 'package:flutter/material.dart';

import 'package:gtu_app/style/style.dart';

class KeepItUp extends StatelessWidget {
  KeepItUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Keep\nit up!',
            style: FontStyle.playfairDisplay(100, FontWeight.w900)
                .copyWith(color: AppColors.keepitupColor, height: 1.2),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Crafted with ❤️ in Surat.',
            style: FontStyle.manrope(20, FontWeight.normal)
                .copyWith(color: AppColors.keepitupColor, letterSpacing: 1),
          ),
        ],
      ),
    );
  }
}
