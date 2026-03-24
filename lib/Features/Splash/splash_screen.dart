import 'package:flutter/material.dart';
import 'package:taskati/Core/Constants/app_images.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/Core/Functions/navigation.dart';
import 'package:taskati/Core/Services/shared_pref.dart';
import 'package:taskati/Core/Styles/colors.dart';
import 'package:taskati/Core/Styles/text_styles.dart';
import 'package:taskati/Features/Home/Page/home_screen.dart';
import 'package:taskati/Features/complete_profile/Page/complete_profile_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
  void initState() {
    super.initState();

    bool isUploaded = SharedPref.getBool(SharedPref.isUploadedKey);

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      if (isUploaded) {
        pushReplacement(context, const HomeScreen());
      } else {
        pushReplacement(context, const CompleteProfileScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Center(
        child: Column(
          // spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppImages.tasklogojson),
            Text('Taskati', style: TextStyles.title.copyWith(fontSize: 24)),
            SizedBox(height: 10),
            Text(
              'It’s time to get organized',
              style: TextStyles.body.copyWith(
                fontSize: 14,
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
