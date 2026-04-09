import 'package:flutter/material.dart';
import 'package:taskati/Core/Common%20Widgets/custom_svg_picture.dart';
import 'package:taskati/Core/Functions/extentions.dart';
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
  color: Colors.transparent,
  child: InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.cardColor, 
        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: CustomSvgPicture(
              path: iconPath,
              height: 18,
              width: 18,
            ),
          ),

          const SizedBox(width: 12),

          /// Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.caption.copyWith(
                    color: AppColors.greyColor,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyles.body.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          Icon(
            Icons.favorite_border,
            color: AppColors.primaryColor.withOpacity(0.7),
            size: 22,
          ),
        ],
      ),
    ),
  ),
);
  }
}