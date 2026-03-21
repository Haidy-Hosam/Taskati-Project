import 'package:flutter/material.dart';
import 'package:taskati/Core/Functions/extentions.dart';
import 'package:taskati/Core/Styles/text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          // backgroundImage: AppImages.personalimage,
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
              'Haidy Hosam El-Dien',
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
