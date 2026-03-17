import 'package:flutter/material.dart';
import 'package:taskati/Core/Constants/app_images.dart';
import 'package:taskati/Core/Styles/colors.dart';
import 'package:taskati/Core/Styles/themes.dart';
import 'package:taskati/Features/Profile/profile_screeen.dart';
import 'package:taskati/Features/complete_profile/Page/complete_profile_screen.dart';
import 'package:taskati/Features/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      builder: (context, child) {
        // return SafeArea(child: child!);
        return Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: AppColors.backgroundColor,
            ),
            Image.asset(
              AppImages.background,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            child ?? Container()
          ],
          
        );
      
      },

      // home: const SplashScreen(),
      home: const ProfileScreen(),
    );
  }
}
