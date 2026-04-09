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
    cardColor: AppColors.backgroundColor,

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

// ======================================================================================================================== //

  static ThemeData get dark => ThemeData(
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
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyles.title.copyWith(
        color: AppColors.backgroundColor,
        fontFamily: AppFonts.lexendDeca,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: AppColors.backgroundColor,
    ),

    cardColor: AppColors.blackColor,
datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.blackColor,
      surfaceTintColor: Colors.transparent,
      headerBackgroundColor: AppColors.primaryColor,
      headerForegroundColor: AppColors.backgroundColor,
      dayForegroundColor: MaterialStateProperty.all(AppColors.backgroundColor),
      yearForegroundColor: MaterialStateProperty.all(AppColors.backgroundColor),
     ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: AppColors.blackColor,
        hourMinuteTextColor: AppColors.backgroundColor,
        dayPeriodTextColor: AppColors.backgroundColor,
        dialHandColor: AppColors.primaryColor,
        dialBackgroundColor: AppColors.blackColor,
        entryModeIconColor: AppColors.backgroundColor,
      ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.caption.copyWith(color: AppColors.greyColor),
      fillColor: AppColors.blackColor,
      filled: true,

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
  );
}
