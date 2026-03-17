import 'package:flutter/material.dart';
import 'package:taskati/Core/Styles/colors.dart';

class SecondaryElevatedButton extends StatelessWidget {
  const SecondaryElevatedButton({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        minimumSize: Size(30, 50),
      ),

      onPressed: () {},
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.primaryColor),
      ),
    );
  }
}
