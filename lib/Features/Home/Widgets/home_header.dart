import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taskati/Core/Constants/app_images.dart';
import 'package:taskati/Core/Functions/extentions.dart';
import 'package:taskati/Core/Services/shared_pref.dart';
import 'package:taskati/Core/Styles/text_styles.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String name = '';
  String path = '';
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
        Column(
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
      ],
    );
  }
}
