import 'package:custom_chat_gpt/feature/presentation/bloc/test_bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/app_colors.dart';

class RegenerateButton extends StatelessWidget {
  const RegenerateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      height: 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.cellBackground,
        border: Border.all(
          color: AppColors.regenerateButtonBorderColor,
        ),
      ),
      child: GestureDetector(
        onTap: () {

          BlocProvider.of<ChatBloc>(context).add(RegenerateButtonPressed());

        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.refresh,
              color: AppColors.iconBlueColor,
            ),
            Text(
              'Regenerate',
              style: TextStyle(
                color: AppColors.iconBlueColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}