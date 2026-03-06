import 'package:flutter/material.dart';
import 'package:taskati/Core/Styles/colors.dart';

class PrimaryElevatedBotton extends StatelessWidget {
  const PrimaryElevatedBotton({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        minimumSize: Size(double.infinity, 50),
      ),

      onPressed: () {},
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.backgroundColor),
      ),
    );
  }
}
