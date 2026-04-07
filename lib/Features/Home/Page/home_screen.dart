import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:taskati/Core/Functions/extentions.dart';
import 'package:taskati/Core/Functions/navigation.dart';
import 'package:taskati/Core/Model/task_model.dart';
import 'package:taskati/Core/Services/hive_helper.dart';
import 'package:taskati/Core/Styles/text_styles.dart';
import 'package:taskati/Features/Add%20Task/Page/add_task.dart';
import 'package:taskati/Features/Home/Widgets/home_header.dart';
import 'package:taskati/Features/Home/Widgets/tasks/tasks_builder.dart';
import 'package:taskati/Features/Home/Widgets/today__progress.dart';
import 'package:taskati/core/styles/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  String selectedDate = DateFormat('dd MMM, yyyy').format(DateTime.now());

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
                  Today_Progress(),
                  25.h,
                  DatePicker(
                    DateTime(DateTime.now().year, 1, 1),
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
                      setState(() {
                        selectedDate = DateFormat('dd MMM, yyyy').format(date);
                      });
                    },
                  ),
                  20.h,
                  ButtonsTabBar(
                    onTap: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    backgroundColor: AppColors.primaryColor,
                    unselectedBackgroundColor: AppColors.accentColor,
                    borderWidth: 3,

                    labelStyle: TextStyles.caption.copyWith(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: TextStyles.caption.copyWith(
                      color: AppColors.primaryColor,
                    ),

                    contentCenter: true,
                    width: (MediaQuery.sizeOf(context).width - 40) / 3,
                    radius: 15,
                    buttonMargin: EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 3,
                    ),
                    // Add your tabs here
                    tabs: [
                      Tab(
                        child: Text(
                          'All',
                          style: TextStyles.caption.copyWith(
                            color: currentIndex == 0
                                ? Colors.white
                                : AppColors.primaryColor,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'In Progress',
                          style: TextStyles.caption.copyWith(
                            color: currentIndex == 1
                                ? Colors.white
                                : AppColors.primaryColor,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Completed',
                          style: TextStyles.caption.copyWith(
                            color: currentIndex == 2
                                ? Colors.white
                                : AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  15.h,
                  SizedBox(
                    height: 300,
                    child: ValueListenableBuilder<Box<TaskModel>>(
                      valueListenable: HiveHelper.taskBox.listenable(),

                      builder: (context, valueBox, child) {
                        final List<TaskModel> dailytasks = [];
                        for (var task in valueBox.values) {
                          if (task.date == selectedDate) {
                            dailytasks.add(task);
                          }
                        }
                        final reverseddailyTasks = dailytasks.reversed.toList();
                        final inprogress = dailytasks
                            .where((task) => !task.isCompleted)
                            .toList();
                        final completed = dailytasks
                            .where((task) => task.isCompleted)
                            .toList();

                        return TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            TasksBuilder(tasks: reverseddailyTasks),
                            TasksBuilder(tasks: inprogress),
                            TasksBuilder(tasks: completed),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pushTo(context, AddEditTaskPage());
        },
        backgroundColor: AppColors.primaryColor,
        elevation: 8,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 28, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
