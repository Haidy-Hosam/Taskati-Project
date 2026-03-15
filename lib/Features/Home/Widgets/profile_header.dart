import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:taskati/Core/Constants/app_images.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/styles/text_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: HiveHelper.userBox.listenable(),
      builder: (context, Box box, child) {

        String name = box.get(HiveHelper.nameKey) ?? "";
        String path = box.get(HiveHelper.imageKey) ?? "";

        return Row(
          children: [
            InkWell(
              onTap: () {
                // Navigations.pushTo(context, const EditProfile());
              },
              child: ClipOval(
                child: path.isNotEmpty
                    ? Image.file(
                        File(path),
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        AppImages.user,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
              ),
            ),

            const Gap(10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello!", style: TextStyles.body),
                Text(name.isNotEmpty ? name : "User", style: TextStyles.headline),
              ],
            ),

            const Spacer(),

            InkWell(
              onTap: () {
                bool isDarkMode = box.get(HiveHelper.isDarkKey) ?? false;
                HiveHelper.cashData(HiveHelper.isDarkKey, !isDarkMode);
              },
              child: Icon(
                (box.get(HiveHelper.isDarkKey) ?? false)
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
            ),
          ],
        );
      },
    );
  }
}