import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Color
class AppColors {
  final Color primaryColor = const Color(0xFFFF6C6C);
  final Color bgColor = const Color(0xFFF5F8FF);

  final Color titleColor = const Color(0xB3000000);

  final Color waterBlueColor = const Color(0xFFD2ECFF);
  final Color lightMossGreenColor = const Color(0xFFD5FAEE);
  final Color lavenderColor = const Color(0xFFECDDFF);
  final Color lightYellowColor = const Color(0xFFF8F7C2);
  final Color lightOrangeColor = const Color(0xFFF8E0D5);
  final Color lightPinkColor = const Color(0xFFF8E4FE);
  final Color lightRedColor = const Color(0xFFF8E2E4);
  final Color lightPistaColor = const Color(0xFFD8FAD7);
  final Color lightGreenColor = const Color(0xFFCDFAF3);
  final Color lightlavenderColor = const Color(0xFFF8E3FD);

  final Color skyBlueColor = const Color(0xFFB5E4FF);
  final Color orangeColor = const Color(0xFFFFC692);
  final Color pistaColor = const Color(0xFFBEF294);

  final Color keepitupColor = const Color(0xFF6B8CA5);

  final Color syllabusTileColor = const Color(0xFFA0C3F9);
  final Color questionPaperTileColor = const Color(0xFF92D8FF);

  final Color percentageCalcFillColor = const Color(0xFFFF9356);
  final Color percentageCalcBgColor = const Color(0xFFFFEFE6);

  final Color linkBlueColor = const Color(0xFF3666D9);

  final Color blackColor = const Color(0XFF000000);
  final Color whiteColor = const Color(0XFFFFFFFF);
}

// Normal padding of all pages
EdgeInsetsGeometry padding = const EdgeInsets.fromLTRB(25, 0, 25, 0);

// const FontWeight thin = FontWeight.w100;
// const FontWeight extraLight = FontWeight.w200;
// const FontWeight light = FontWeight.w300;
// const FontWeight regular = FontWeight.w400;
// const FontWeight medium = FontWeight.w500;
// const FontWeight semiBold = FontWeight.w600;
// const FontWeight bold = FontWeight.w700;
// const FontWeight extraBold = FontWeight.w800;
// const FontWeight thick = FontWeight.w900;

// Font Style
class FontStyle {
  TextStyle manrope(double fontSize, FontWeight fontWeight) {
    return GoogleFonts.manrope(fontSize: fontSize, fontWeight: fontWeight);
  }

  TextStyle montserrat(double fontSize, FontWeight fontWeight) {
    return GoogleFonts.montserrat(fontSize: fontSize, fontWeight: fontWeight);
  }

  TextStyle playfairDisplay(double fontSize, FontWeight fontWeight) {
    return GoogleFonts.playfairDisplay(
        fontSize: fontSize, fontWeight: fontWeight);
  }

  TextStyle ebGaramond(double fontSize, FontWeight fontWeight) {
    return GoogleFonts.ebGaramond(fontSize: fontSize, fontWeight: fontWeight);
  }

  TextStyle mPlusRounded1c(double fontSize, FontWeight fontWeight) {
    return GoogleFonts.ebGaramond(fontSize: fontSize, fontWeight: fontWeight);
  }
}
// styles of widget
