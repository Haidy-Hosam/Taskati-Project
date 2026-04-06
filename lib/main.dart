import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taskati/Core/Constants/app_images.dart';
import 'package:taskati/Core/Services/hive_helper.dart';
import 'package:taskati/Core/Services/shared_pref.dart';
import 'package:taskati/Core/Styles/colors.dart';
import 'package:taskati/Core/Styles/themes.dart';
import 'package:taskati/Features/Add%20Task/Page/add_task.dart';
import 'package:taskati/Features/Home/Page/home_screen.dart';
import 'package:taskati/Features/Splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPref.init();
  await HiveHelper.initt();
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
        return SafeArea(
          top: false,
          bottom: Platform.isAndroid,
          child: Stack(
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
              child ?? Container(),
            ],
          ),
        );
      },

      // home: const SplashScreen(),
      home: const HomeScreen(),
    );
  }
}
