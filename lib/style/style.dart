import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Color
class AppColors {
  static Color primaryColor = const Color(0xFFFF6C6C);
  static Color bgColor = const Color(0xFFF5F8FF);
  static Color drawerBgColor = const Color(0xFFEBEFF9);

  static Color titleColor = const Color(0xB3000000);

  static Color waterBlueColor = const Color(0xFFD2ECFF);
  static Color lightMossGreenColor = const Color(0xFFD5FAEE);
  static Color lavenderColor = const Color(0xFFECDDFF);
  static Color lightYellowColor = const Color(0xFFF8F7C2);
  static Color lightOrangeColor = const Color(0xFFF8E0D5);
  static Color lightPinkColor = const Color(0xFFF8E4FE);
  static Color lightRedColor = const Color(0xFFF8E2E4);
  static Color lightPistaColor = const Color(0xFFD8FAD7);
  static Color lightGreenColor = const Color(0xFFCDFAF3);
  static Color lightlavenderColor = const Color(0xFFF8E3FD);

  static Color skyBlueColor = const Color(0xFFB5E4FF);
  static Color orangeColor = const Color(0xFFFFC692);
  static Color pistaColor = const Color(0xFFBEF294);

  static Color keepitupColor = const Color(0xFF6B8CA5);

  static Color syllabusTileColor = const Color(0xFFA0C3F9);
  static Color questionPaperTileColor = const Color(0xFF92D8FF);

  static Color percentageCalcFillColor = const Color(0xFFFF9356);
  static Color percentageCalcBgColor = const Color(0xFFFFEFE6);

  static Color linkBlueColor = const Color(0xFF3666D9);
  static Color linkBlueBgColor = const Color(0xFFD4DEF7);

  static Color errorColor = const Color(0xFFFFCFCF);
  static Color warningColor = const Color(0xFFFFF9BF);
  static Color sucessColor = const Color(0xFFBEF294);
  static Color noInternetColor = const Color(0xFFB5E4FF);

  static Color blackColor = const Color(0XFF000000);
  static Color whiteColor = const Color(0XFFFFFFFF);
}

// Font Style
class FontStyle {
  static TextStyle manrope(double fontSize, FontWeight fontWeight) {
    return GoogleFonts.manrope(fontSize: fontSize, fontWeight: fontWeight);
  }

  static TextStyle montserrat(double fontSize, FontWeight fontWeight) {
    return GoogleFonts.montserrat(fontSize: fontSize, fontWeight: fontWeight);
  }

  static TextStyle playfairDisplay(double fontSize, FontWeight fontWeight) {
    return GoogleFonts.playfairDisplay(
        fontSize: fontSize, fontWeight: fontWeight);
  }

  static TextStyle ebGaramond(double fontSize, FontWeight fontWeight) {
    return GoogleFonts.ebGaramond(fontSize: fontSize, fontWeight: fontWeight);
  }

  static TextStyle mPlusRounded1c(double fontSize, FontWeight fontWeight) {
    return GoogleFonts.mPlusRounded1c(
        fontSize: fontSize, fontWeight: fontWeight);
  }
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