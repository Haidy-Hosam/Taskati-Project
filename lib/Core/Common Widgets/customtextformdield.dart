import 'package:flutter/material.dart';
import 'package:taskati/Core/Styles/colors.dart';

class customtextformdield extends StatelessWidget {
  const customtextformdield({super.key,});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: AppColors.greyColor,
            width: 0.5,
          ),  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(14),
    borderSide: BorderSide(color: AppColors.primaryColor, width: .5),
  ),
)
    );
  }
}
