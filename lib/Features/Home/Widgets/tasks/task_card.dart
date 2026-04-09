import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:taskati/Core/Functions/extentions.dart';
import 'package:taskati/Core/Functions/navigation.dart';
import 'package:taskati/Core/Model/task_model.dart';
import 'package:taskati/Features/Add%20Task/Page/add_task.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/styles/colors.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),

            const Gap(6),

            Text(
              task.description,
              style: TextStyle(fontSize: 13, color: AppColors.greyColor),
              overflow: TextOverflow.ellipsis,
            ),
            const Gap(6),

            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    AppImages.timecircleSvg,
                    width: 16,
                    height: 16,
                    color: AppColors.primaryColor,
                  ),
                ),

                const Gap(10),

                Text("${task.startTime} - ${task.endTime}"),

                const Spacer(),

                

                const Gap(10),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    task.isCompleted ? "Done" : "In Progress",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
              
            ),
            10.h,
Align(
              alignment: Alignment.topRight,
  child: GestureDetector(
    onTap: () async {
      pushTo(
        context,
        AddEditTaskPage(task: task),
      );
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),

      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.edit,
            size: 16,
            color: AppColors.primaryColor,
          ),
          const Gap(6),
          Text(
            "Edit",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  ),
)
          ],
        ),
      ),
    );
  }
}
