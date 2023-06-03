import 'package:custom_chat_gpt/feature/presentation/widget/chat_content.dart';
import 'package:flutter/material.dart';

import 'bottom_panel.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Center(child: ChatContent()),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomPanel(),
        ),
      ],
    );
  }
}
