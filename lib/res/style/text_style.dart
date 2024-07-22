import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justwravel/res/style/text_fonts_style.dart';

import '../color.dart';

class AppStyle {
  static AppStyle instance = AppStyle._init();

  AppStyle._init();

  final TextStyle h2Bold = GoogleFonts.urbanist(
    color: AppColors.whiteColor,
    fontSize: 40,
    fontWeight: FontWeight.w700,
  );

  final TextStyle h4Bold = GoogleFonts.urbanist(
    color: AppColors.whiteColor,
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );

  final TextStyle h5Bold = GoogleFonts.urbanist(
    color: AppColors.whiteColor,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  final TextStyle bodyXLarge = GoogleFonts.urbanist(
    color: AppColors.whiteColor,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  final TextStyle bodyMedium = GoogleFonts.urbanist(
    color: AppColors.whiteColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  final TextStyle bodyNormal = Typogaphy.Regular.copyWith(
      color: AppColors.blackColor,
    fontSize: 15,
    fontWeight: FontWeight.w400

  );
  final TextStyle bodyLight = Typogaphy.Light.copyWith(
      color: AppColors.blackColor,
      fontSize: 10,
      fontWeight: FontWeight.w300

  );
  final TextStyle bodySemi = Typogaphy.SemiBold.copyWith(
      color: AppColors.whiteColor,
      fontSize: 15,
      fontWeight: FontWeight.w600

  );
  final TextStyle bodyLight10 = Typogaphy.Light.copyWith(
      color: AppColors.whiteColor,
      fontSize: 8,
      fontWeight: FontWeight.w300

  );
  final TextStyle priceRegular = Typogaphy.Regular.copyWith(
      color: AppColors.whiteColor,
      fontSize: 12,
      fontWeight: FontWeight.w500

  );

  final TextStyle bodySmall = GoogleFonts.urbanist(
    color: AppColors.whiteColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  final TextStyle bodySmallBold = GoogleFonts.urbanist(
    color: AppColors.whiteColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  final TextStyle bodyVerySmall = GoogleFonts.urbanist(
    color: AppColors.whiteColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  final TextStyle bodyVerySmallBold = GoogleFonts.urbanist(
    color: AppColors.whiteColor,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

}
