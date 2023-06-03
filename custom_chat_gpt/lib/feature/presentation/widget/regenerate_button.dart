import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';

class RegenerateButton extends StatelessWidget {
  const RegenerateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.inputFieldBackground,
        border: Border.all(
          color: AppColors.regenerateButtonBorderColor,
        ),
      ),
      child: GestureDetector(
        onTap: () {},
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