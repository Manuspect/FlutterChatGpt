import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import 'question_text_field.dart';
import 'regenerate_button.dart';

class BottomPanel extends StatelessWidget {
  const BottomPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 768,
      height: 150,
      child: BottomSheet(
        enableDrag: false,
        backgroundColor: AppColors.mainBackground,
        builder: (context) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RegenerateButton(),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 30, top: 8, left: 8, right: 8),
                child: QuestionTextField(),
              ),
            ],
          );
        },
        onClosing: () {},
      ),
    );
  }
}