import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskati/Core/Constants/app_font.dart';
import 'package:taskati/Core/Styles/colors.dart';
import 'package:taskati/Core/Styles/text_styles.dart';

class AppThemes {
  static ThemeData get light => ThemeData(
    fontFamily: AppFonts.lexendDeca,
    scaffoldBackgroundColor: AppColors.backgroundColor,
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
      backgroundColor: AppColors.backgroundColor,
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
