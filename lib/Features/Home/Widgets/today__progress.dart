import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:taskati/Core/Functions/extentions.dart';
import 'package:taskati/Core/Model/task_model.dart';
import 'package:taskati/Core/Services/hive_helper.dart';
import 'package:taskati/Core/Styles/text_styles.dart';
import 'package:taskati/core/styles/colors.dart';

class Today_Progress extends StatefulWidget {
  const Today_Progress({
    super.key,
  });
  @override
  State<Today_Progress> createState() => _Today_ProgressState();
}

class _Today_ProgressState extends State<Today_Progress> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<TaskModel>>(
      valueListenable: HiveHelper.taskBox.listenable(),
        builder: (context, box, child)  {      
      List<TaskModel> dailyTasks = [];
        for (var task in box.values) {
          if (task.date == DateFormat('dd MMM, yyyy').format(DateTime.now())) {
            dailyTasks.add(task);
          }
        }

        final completedTasks = dailyTasks
            .where((task) => task.isCompleted)
            .toList();
        final totalTasks = dailyTasks.length;
        final progressPercentage = totalTasks == 0
            ? 0
            : (completedTasks.length / totalTasks) * 100;


      return Container(
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
                    value: progressPercentage/100,
                    constraints: BoxConstraints(
                      minHeight: 70,
                      minWidth: 70,
                      maxHeight: 70,
                      maxWidth: 70,
                    ),
                  ),
                  Text(
                    '${(progressPercentage).toInt()}%',
                    style: TextStyles.body.copyWith(
                      color: AppColors.backgroundColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
        }
    );
  }
}
