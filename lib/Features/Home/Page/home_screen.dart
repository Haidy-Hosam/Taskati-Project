import 'package:flutter/material.dart';
import 'package:taskati/Core/Constants/app_images.dart';
import 'package:taskati/Core/Functions/extentions.dart';
import 'package:taskati/Core/Styles/text_styles.dart';
import 'package:taskati/Features/Home/Widgets/home_header.dart';
import 'package:taskati/core/styles/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
          child: Column(
            children: [
              HomeHeader(),
              30.h,
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tue, 17 Feb',
                            style: TextStyles.body.copyWith(
                              color: AppColors.backgroundColor,
                            ),
                          ),
                          20.h,
                          Text(
                            'Your today’s task almost\nalmost',
                            style: TextStyles.body.copyWith(
                              color: AppColors.backgroundColor,
                            ),
                          ),
                        ],
                      ),
                      50.w,
                      Image.asset(AppImages.ca)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
