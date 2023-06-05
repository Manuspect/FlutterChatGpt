import 'package:custom_chat_gpt/common/app_colors.dart';
import 'package:flutter/material.dart';

class UserQuestionCard extends StatelessWidget {
  final String message;
  const UserQuestionCard({
    super.key,
    this.message = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.mainBackground,
      ),
      width: 768,
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(
          message,
          style: const TextStyle(
            fontSize: 16,
            // height: 24,
          ),
        ),
      ),
    );
  }
}
