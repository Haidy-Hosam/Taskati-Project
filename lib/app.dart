import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskati/Core/Constants/app_images.dart';
import 'package:taskati/Core/Styles/colors.dart';
import 'package:taskati/Core/Styles/themes.dart';
import 'package:taskati/Core/presentation/cubit/theme_cubit.dart';
import 'package:taskati/Core/presentation/cubit/theme_state.dart';
import 'package:taskati/Features/Home/Page/home_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final isDarkMode = context.read<ThemeCubit>().isDarkMode;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemes.light,
            darkTheme: AppThemes.dark,
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            builder: (context, child) {
              // return SafeArea(child: child!);
              return SafeArea(
                top: false,
                bottom: Platform.isAndroid,
                child: Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      // color: AppColors.backgroundColor,
                      color: isDarkMode
                          ? AppColors.blackColor
                          : AppColors.backgroundColor,
                    ),
                    Image.asset(
                      AppImages.background,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    child ?? Container(),
                  ],
                ),
              );
            },

            // home: const SplashScreen(),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
