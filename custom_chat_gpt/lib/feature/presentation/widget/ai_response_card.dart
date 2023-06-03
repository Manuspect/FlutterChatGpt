import 'package:custom_chat_gpt/common/app_colors.dart';
import 'package:flutter/material.dart';

class AIResponseCard extends StatelessWidget {
  final String message;
  const AIResponseCard({
    super.key,
    this.message = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.cellBackground,
      ),
      width: 768,
      child: ListTile(
        leading: Image.asset('assets/images/ai_logo.png'),
        title: Text(
          message,
          style: TextStyle(
            fontSize: 16,
            // height: 24,
          ),
        ),
      ),
    );
  }
}
