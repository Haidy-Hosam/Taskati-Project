import 'package:flutter/material.dart';
import 'package:taskati/Core/Common Widgets/customtextformdield.dart';
import 'package:taskati/Core/Common Widgets/primary_elevated_button.dart';
import 'package:taskati/Core/Common Widgets/secondary_elevated_button.dart';
import 'package:taskati/Core/Constants/app_images.dart';
import 'package:taskati/Core/Functions/extentions.dart';
import 'package:taskati/Core/Functions/navigation.dart';
import 'package:taskati/Core/Styles/colors.dart';
import 'package:taskati/Core/Styles/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text(
          "Your Profile",
          style: TextStyles.title.copyWith(fontSize: 18),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: PrimaryElevatedBotton(
          title: "Save",
          onPressed: () {
            pushReplacement(context, ProfileScreen());
          },
        ),
      ),
    );
  }
}
