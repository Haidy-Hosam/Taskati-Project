import 'dart:io';
import 'package:taskati/Core/Constants/app_images.dart';
import 'package:taskati/Core/Functions/extentions.dart';
import 'package:taskati/Core/Services/hive_helper.dart';
import 'package:taskati/Core/Services/shared_pref.dart';
import 'package:taskati/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskati/Core/presentation/cubit/theme_cubit.dart';


class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String name = '';
  String path = '';
  bool value = HiveHelper.getData(HiveHelper.isDarkModeKey) == true;

  @override
  void initState() {
    super.initState();
    getcachrdata();
  }

  Future<void> getcachrdata() async {
    name = SharedPref.getString(SharedPref.nameKey);
    path = SharedPref.getString(SharedPref.imageKey);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: path.isNotEmpty
              ? Image.file(
                  File(path),
                  fit: BoxFit.cover,
                  width: 60,
                  height: 60,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      AppImages.user,
                      fit: BoxFit.cover,
                      width: 60,
                      height: 60,
                    );
                  },
                )
              : Image.asset(AppImages.user, height: 50),
        ),
        12.w,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello ,',
                style: TextStyles.title.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                name,
                style: TextStyles.body.copyWith(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            context.read<ThemeCubit>().updateTheme();
          },
          icon: Icon(value ? Icons.dark_mode : Icons.light_mode),
        ),
      ],
    );
  }
}
