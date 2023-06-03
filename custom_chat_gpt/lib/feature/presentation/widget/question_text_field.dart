import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';

class QuestionTextField extends StatelessWidget {
  const QuestionTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {},
        ),
        suffixIconConstraints: const BoxConstraints(minWidth: 60),
        suffixIconColor: AppColors.iconBlueColor,
        focusColor: AppColors.inputFieldBackground,
        label: Text('Send a message'),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: AppColors.inputFieldBackground,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.iconBlueColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.iconBlueColor,
          ),
        ),
      ),
    );
  }
}