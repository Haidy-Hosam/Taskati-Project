import 'package:flutter/material.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:intl/intl.dart';
import 'package:taskati/Core/Functions/navigation.dart';
import 'package:taskati/Core/Styles/colors.dart';
import 'package:taskati/Core/Styles/text_styles.dart';
import 'package:taskati/Core/services/hive_helper.dart';
import 'package:taskati/Features/AddTask/add_task_screen.dart';
import 'package:taskati/Features/Home/Widgets/all_task_widget.dart';
import 'package:taskati/Features/Home/Widgets/profile_header.dart';
import 'package:taskati/Features/Home/Widgets/today_progress.dart';
import 'package:taskati/core/model/task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatePickerController controller = DatePickerController();

  String _selectedDate = DateFormat("dd MMM, yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                ProfileHeader(),
                20.H,
                TodayProgress(),
                20.H,

                DatePicker(
                  DateTime.now(),
                  controller: controller,
                  width: 64,
                  height: 90,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: AppColors.primaryColor,
                  selectedTextColor: Colors.white,
                  unselectedColor: AppColors.accentColor,
                  onDateChange: (date) {
                    setState(() {
                      _selectedDate =
                          DateFormat("dd MMM, yyyy").format(date);
                    });
                  },
                ),

                8.H,

                ButtonsTabBar(
                  unselectedBackgroundColor: AppColors.accentColor,
                  contentCenter: true,
                  buttonMargin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  radius: 20,
                  backgroundColor: AppColors.primaryColor,
                  width: MediaQuery.of(context).size.width * .3,
                  borderColor: Colors.black,
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: TextStyles.caption.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: const [
                    Tab(text: "All Tasks"),
                    Tab(text: "In Progress"),
                    Tab(text: "Completed"),
                  ],
                ),

                20.H,

                Expanded(
                  child: ValueListenableBuilder<Box<TaskModel>>(
                    valueListenable: HiveHelper.taskBox.listenable(),
                    builder: (context, box, child) {
                      final dailyTasks = box.values.toList();

                      final dailyTasksWithDate = dailyTasks
                          .where((task) => task.date == _selectedDate)
                          .toList();

                      final inProgressTasks = dailyTasksWithDate
                          .where((task) => !task.isCompleted)
                          .toList();

                      final completedTasks = dailyTasksWithDate
                          .where((task) => task.isCompleted)
                          .toList();

                      return TabBarView(
                        children: [
                          AllTaskWidget(tasks: dailyTasksWithDate),
                          AllTaskWidget(tasks: inProgressTasks),
                          AllTaskWidget(tasks: completedTasks),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.small(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          pushTo(context, AddTaskScreen());
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}