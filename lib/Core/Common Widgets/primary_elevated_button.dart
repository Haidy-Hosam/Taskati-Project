import 'package:flutter/material.dart';
import 'package:taskati/Core/Styles/colors.dart';

class PrimaryElevatedBotton extends StatelessWidget {
  const PrimaryElevatedBotton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        minimumSize: Size(double.infinity, 50),
      ),

      onPressed: onPressed,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.backgroundColor , fontSize: 19 ,fontWeight: FontWeight.w600),
      ),
    );
  }
}
