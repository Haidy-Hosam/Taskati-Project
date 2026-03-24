import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  // final TabController tabController = TabController(length: 3, vsync: vsync);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
          child: DefaultTabController(
            length: 3,
            child: SingleChildScrollView(
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
                                // 'Tue, 17 Feb',
                                DateFormat.MMMEd().format(DateTime.now()),
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
                          // Image.asset(AppImages.ca)
                          Stack(
                            alignment: AlignmentGeometry.center,
                            children: [
                              CircularProgressIndicator(
                                color: AppColors.backgroundColor,
                                backgroundColor: AppColors.lightgreyColor,
                                strokeWidth: 9,
                                strokeAlign: 2,
                                strokeCap: StrokeCap.round,
                                value: .7,
                                constraints: BoxConstraints(
                                  minHeight: 70,
                                  minWidth: 70,
                                  maxHeight: 70,
                                  maxWidth: 70,
                                ),
                              ),
                              Text(
                                '70%',
                                style: TextStyles.body.copyWith(
                                  color: AppColors.backgroundColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  25.h,
                  DatePicker(
                    DateTime.now(),
                    height: 95,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: AppColors.primaryColor,
                    dayTextStyle: TextStyles.caption,
                    dateTextStyle: TextStyles.caption.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                    monthTextStyle: TextStyles.caption,
                    onDateChange: (date) {
                      // New date selected
                    },
                  ),
                  20.h,
                  TabBar(
                    dividerColor: Colors.transparent,
                    indicatorColor: AppColors.primaryColor,
                    indicatorSize: TabBarIndicatorSize.tab,
              
                    labelStyle: TextStyles.caption.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.backgroundColor,
                    ),
              
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryColor,
                    ),
              
                    indicatorPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
              
                    unselectedLabelStyle: TextStyles.caption,
                    tabs: [
                      Tab(child: Text('All', style: TextStyles.caption)),
                      Tab(child: Text('In Progress', style: TextStyles.caption)),
                      Tab(child: Text('Completed', style: TextStyles.caption)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
