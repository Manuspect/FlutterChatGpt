import 'package:custom_chat_gpt/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final Color? color;
  final Function()? onTap;
  final List<TextInputFormatter>? formatters;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final String hintText;
  final TextEditingController controller;
  const CustomTextField(
      {super.key,
      required this.color,
      required this.hintText,
      required this.controller,
      required this.onTap,
      this.focusNode,
      this.onFieldSubmitted,
      this.formatters,
      this.onChanged,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration:  BoxDecoration(color: AppColors.animate,  borderRadius: BorderRadius.circular(10.r),),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(top: 1.h, left: 15),
              child: TextField(
                controller: controller,
                // expands: true,
                autofocus: false,
                onChanged: onChanged,
                maxLines: maxLines,
                inputFormatters: formatters,
                onSubmitted: onFieldSubmitted,
                onTap: onTap,
                decoration: InputDecoration(
                  hintText: hintText,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
