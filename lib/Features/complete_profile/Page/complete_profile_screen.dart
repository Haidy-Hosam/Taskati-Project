import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/Core/Common Widgets/customtextformdield.dart';
import 'package:taskati/Core/Common Widgets/primary_elevated_button.dart';
import 'package:taskati/Core/Common Widgets/secondary_elevated_button.dart';
import 'package:taskati/Core/Constants/app_images.dart';
import 'package:taskati/Core/Functions/extentions.dart';
import 'package:taskati/Core/Functions/navigation.dart';
import 'package:taskati/Core/Styles/colors.dart';
import 'package:taskati/Core/Styles/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskati/Features/Profile/profile_screeen.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "Complete Your Profile",
            style: TextStyles.title.copyWith(fontSize: 18),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
      Gap(50),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Profile Image',
                  style: TextStyles.body.copyWith(
                    fontSize: 12,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
              20.h,
              Stack(
                children: [
                  CircleAvatar(
                    radius: 90,
                    backgroundImage: AssetImage(AppImages.personalimage),
                  ),
      
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(AppImages.deletedIconSvg),
                    ),
                  ),
                ],
              ),
      
              30.h,
      
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SecondaryElevatedButton(title: "From Camera"),
                  20.w,
                  SecondaryElevatedButton(title: "From Gallery"),
                ],
              ),
      
              50.h,
      
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Your Name',
                  style: TextStyles.body.copyWith(
                    fontSize: 12,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
              10.h,
              customtextformdield(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
        child: PrimaryElevatedBotton(
          title: "Let's Start !",
          onPressed: () {
            pushReplacement(context, ProfileScreen());
          },
        ),
      ),
    );
  }
}
