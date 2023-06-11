import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color_manager/color_manager.dart';

ThemeData getApplicationTheme() {
  var appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    primaryColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.light),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 24,
        color: AppColors.light,
      ),
    ),
    textTheme: TextTheme(
      //headlines
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 24,
        color: AppColors.darkColor,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: AppColors.darkColor,
      ),

      //body
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: AppColors.darkColor,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColors.darkColor,
      ),

      //label
      labelSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: AppColors.darkColor,
      ),
    ),
  );
  return appTheme.copyWith(
    textTheme: GoogleFonts.nunitoTextTheme(appTheme.textTheme),
  );
}
