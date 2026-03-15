import 'package:flutter/material.dart';
import 'package:taskati/Core/Constants/app_images.dart';
import 'package:taskati/Core/Styles/colors.dart';
import 'package:taskati/Core/Styles/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Complete Your Profile",
          style: TextStyles.title.copyWith(fontSize: 18 ,),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
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
              SizedBox(height: 10),
              Stack(
                children: [
                  ClipOval(
                    child: Image.asset(
                      AppImages.personalimage,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                          padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        shape: BoxShape.circle
                      ),
                      child: SvgPicture.asset(AppImages.deletedIconSvg)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
