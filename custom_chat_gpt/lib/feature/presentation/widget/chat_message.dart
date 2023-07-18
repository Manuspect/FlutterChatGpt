import 'package:custom_chat_gpt/common/app_colors.dart';
import 'package:custom_chat_gpt/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/models/message_to_send_model.dart';

class ChatMessageCard extends StatelessWidget {
  final ChatMessage chatMessage;
  const ChatMessageCard({
    super.key,
    required this.chatMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: chatMessage.role == Role.assistant ? AppColors.cellBackground : AppColors.mainBackground,
      ),
      width: 768,
      child: ListTile(
        leading: chatMessage.role == Role.assistant
            ? Image.asset(
                Images.ai,
                height: 25,
                width: 25,
              )
            : SvgPicture.asset(
                Images.me,
              ),
        title: Text(
          chatMessage.content,
          style: const TextStyle(
            fontSize: 16,
            // height: 24,
          ),
        ),
      ),
    );
  }
}
