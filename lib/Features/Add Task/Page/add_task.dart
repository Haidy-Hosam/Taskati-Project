import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/Core/Model/task_model.dart';
import 'package:taskati/Core/Services/hive_helper.dart';
import 'package:taskati/Features/Add%20Task/widgets/task_date_time_card.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/styles/colors.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/Core/Common%20Widgets/customtextformdield.dart';
import 'package:taskati/Core/Common%20Widgets/primary_elevated_button.dart';

class AddEditTaskPage extends StatefulWidget {
  const AddEditTaskPage({super.key, this.task});
  final TaskModel? task;
  @override
  State<AddEditTaskPage> createState() => _AddEditTaskPageState();
}

class _AddEditTaskPageState extends State<AddEditTaskPage> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  String _date = DateFormat('dd MMM, yyyy').format(DateTime.now());
  String _startTime = DateFormat('hh:mm a').format(DateTime.now());
  String _endTime = DateFormat('hh:mm a').format(DateTime.now());

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController();
    descriptionController = TextEditingController();

    if (widget.task != null) {
      titleController.text = widget.task!.title;
      descriptionController.text = widget.task!.description;

      _date = widget.task!.date;
      _startTime = widget.task!.startTime;
      _endTime = widget.task!.endTime;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        _date = DateFormat('dd MMM, yyyy').format(selectedDate);
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStart) async {
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      final dateTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        selectedTime.hour,
        selectedTime.minute,
      );

      setState(() {
        if (isStart) {
          _startTime = DateFormat('hh:mm a').format(dateTime);
        } else {
          _endTime = DateFormat('hh:mm a').format(dateTime);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: TextStyles.caption.copyWith(
                color: AppColors.greyColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            customtextformdield(controller: titleController, maxLines: 1),

            const SizedBox(height: 20),

            Text(
              'Description',
              style: TextStyles.caption.copyWith(
                color: AppColors.greyColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            customtextformdield(controller: descriptionController),

            const SizedBox(height: 20),

            TaskDateTimeCard(
              title: 'Date',
              value: _date,
              iconPath: AppImages.calenderSvg,
              onTap: () => _selectDate(context),
            ),

            const SizedBox(height: 16),

            TaskDateTimeCard(
              title: 'Start Time',
              value: _startTime,
              iconPath: AppImages.timecircleSvg,
              onTap: () => _selectTime(context, true),
            ),

            const SizedBox(height: 16),

            TaskDateTimeCard(
              title: 'End Time',
              value: _endTime,
              iconPath: AppImages.timecircleSvg,
              onTap: () => _selectTime(context, false),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
        child: PrimaryElevatedBotton(
          title: "Add Task",
          onPressed: () async {
            if (titleController.text.trim().isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please enter a task title')),
              );
              return;
            }

            try {
              final taskId =
                  widget.task?.id ?? DateTime.now().toIso8601String();
              await HiveHelper.cacheTask(
                taskId,
                TaskModel(
                  id: taskId,
                  title: titleController.text.trim(),
                  description: descriptionController.text.trim(),
                  date: _date,
                  startTime: _startTime,
                  endTime: _endTime,
                  isCompleted: false,
                ),
              );

              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    widget.task != null
                        ? 'Task updated successfully !'
                        : 'Task added successfully',
                  ),
                ),
              );
              Navigator.pop(context, true);
            } catch (error) {
              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to add task: $error')),
              );
            }
          },
        ),
      ),
    );
  }
}
