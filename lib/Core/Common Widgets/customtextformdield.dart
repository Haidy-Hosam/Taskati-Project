import 'package:flutter/material.dart';
import 'package:taskati/Core/Styles/colors.dart';

class customtextformdield extends StatelessWidget {
  const customtextformdield({
    super.key,
    required this.controller,
    this.hintText,
    this.label,
    this.maxLines = 4,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? label;
  final int maxLines;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      maxLines: maxLines,
      minLines: maxLines == 1 ? 1 : maxLines,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: label,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColors.greyColor, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColors.primaryColor, width: .5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.red, width: 0.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.red, width: 0.5),
        ),
      ),
    );
  }
}
