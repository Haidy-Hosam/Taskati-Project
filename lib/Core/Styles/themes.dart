import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskati/Core/Constants/app_font.dart';
import 'package:taskati/Core/Styles/colors.dart';
import 'package:taskati/Core/Styles/text_styles.dart';

class AppThemes {
  static ThemeData get light => ThemeData(
    fontFamily: AppFonts.lexendDeca,
    scaffoldBackgroundColor: Colors.transparent,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0),
        minimumSize: Size.zero,
        foregroundColor: AppColors.primaryColor,
      ),
    ),

    dividerColor: Colors.transparent,
    dividerTheme: DividerThemeData(color: AppColors.blackColor),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyles.title.copyWith(
        color: AppColors.blackColor,
        fontFamily: AppFonts.lexendDeca,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: AppColors.blackColor,
    ),

    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.caption.copyWith(color: AppColors.greyColor),
      fillColor: AppColors.backgroundColor,
      filled: true,
      // suffixIcon: suffixicon,
      // border: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(20),
      //   borderSide: BorderSide.none,
      // ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.backgroundColor),
        borderRadius: BorderRadius.circular(20),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.backgroundColor),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.backgroundColor),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    // inputDecorationTheme: InputDecorationTheme(
    //   fillColor: AppColors.accentColor,
    //   filled: true,
    //   hintStyle: TextStyles.caption1.copyWith(color: AppColors.),
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(20),
    //     borderSide: BorderSide.none,
    //   ),
    // ),
  );
}
