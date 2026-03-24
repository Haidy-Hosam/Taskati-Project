import 'package:flutter/material.dart';
import 'package:taskati/Core/Common%20Widgets/custom_svg_picture.dart';
import 'package:taskati/core/styles/colors.dart';
import 'package:taskati/core/styles/text_styles.dart';

class TaskDateTimeCard extends StatelessWidget {
  const TaskDateTimeCard({
    super.key,
    required this.title,
    required this.value,
    required this.iconPath,
    this.onTap,
  });

  final String title;
  final String value;
  final String iconPath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.backgroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            // color: context.,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.secondryColor.withValues(alpha: .1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              CustomSvgPicture(path: iconPath, height: 24, width: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyles.caption.copyWith(
                        color: AppColors.greyColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      value,
                      style: TextStyles.caption.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Icon(
                Icons.favorite_border,
                color: AppColors.primaryColor,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}