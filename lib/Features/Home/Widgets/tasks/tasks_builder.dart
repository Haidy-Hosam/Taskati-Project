import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/Core/Model/task_model.dart';
import 'package:taskati/Core/Services/hive_helper.dart';
import 'package:taskati/Features/Home/Widgets/tasks/task_card.dart';
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
