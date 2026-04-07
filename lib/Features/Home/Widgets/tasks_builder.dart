import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:taskati/Core/Functions/extentions.dart';
import 'package:taskati/Core/Functions/navigation.dart';
import 'package:taskati/Core/Model/task_model.dart';
import 'package:taskati/Core/Services/hive_helper.dart';
import 'package:taskati/Features/Add%20Task/Page/add_task.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/styles/colors.dart';

class TasksBuilder extends StatefulWidget {
  const TasksBuilder({super.key, required this.tasks});
  final List<TaskModel> tasks;
  @override
  State<TasksBuilder> createState() => _TasksBuilderState();
}

class _TasksBuilderState extends State<TasksBuilder> {
  @override
  Widget build(BuildContext context) {
    if (widget.tasks.isEmpty) {
      return const Center(
        child: Text(
          'No tasks for this date yet',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.separated(
      itemCount: widget.tasks.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Gap(12);
      },
      itemBuilder: (BuildContext context, int index) {
        final task = widget.tasks[index];

        return Dismissible(
          key: ValueKey(task.id),

          background: Container(
            color: AppColors.green,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.check,
              color: AppColors.backgroundColor,
            ),
          ),

          secondaryBackground: Container(
            color: AppColors.redColor,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.delete,
              color: AppColors.backgroundColor,
            ),
          ),

          confirmDismiss: (direction) async {
            if (direction == DismissDirection.startToEnd) {
              await HiveHelper.cacheTask(
                task.id,
                task.copyWith(isCompleted: true),
              );

              if (!mounted) return false;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Task marked as completed')),
              );
              return false;
            }

            return true;
          },

          onDismissed: (direction) async {
            await HiveHelper.taskBox.delete(task.id);
          },

          child: TaskCard(task: task),
        );
      },
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
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
