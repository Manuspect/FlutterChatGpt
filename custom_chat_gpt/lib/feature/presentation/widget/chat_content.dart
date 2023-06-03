import 'package:custom_chat_gpt/feature/presentation/widget/ai_response_card.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/user_question_card.dart';
import 'package:flutter/material.dart';

class ChatContent extends StatefulWidget {
  const ChatContent({super.key});

  @override
  State<ChatContent> createState() => _ChatContentState();
}

class _ChatContentState extends State<ChatContent> {
  bool isAIResponse = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 768,
      child: ListView(
        children: [
          ...testMessages.map((e) {
            isAIResponse = !isAIResponse;
            return isAIResponse
                ? AIResponseCard(
                    message: e,
                  )
                : UserQuestionCard(
                    message: e,
                  );
          }).toList(),
          const SizedBox(
            height: 150,
          )
        ],
      ),
    );
  }
}

List<String> testMessages = [
  'Non magna et enim voluptate sit ea occaecat consequat esse id. Duis nostrud voluptate in esse esse. In cillum reprehenderit tempor proident laboris culpa officia mollit ullamco aliquip laboris dolore. Velit anim do occaecat tempor amet culpa in.',
  'Eiusmod sint consectetur proident qui esse laboris. Sit aliquip enim qui ex nulla aliqua. Nostrud cillum mollit Lorem excepteur sunt officia mollit laboris magna. Aliqua eu consequat fugiat anim laborum. Proident ipsum in aute est.'
  'Non magna et enim voluptate sit ea occaecat consequat esse id. Duis nostrud voluptate in esse esse. In cillum reprehenderit tempor proident laboris culpa officia mollit ullamco aliquip laboris dolore. Velit anim do occaecat tempor amet culpa in.',
  'Eiusmod sint consectetur proident qui esse laboris. Sit aliquip enim qui ex nulla aliqua. Nostrud cillum mollit Lorem excepteur sunt officia mollit laboris magna. Aliqua eu consequat fugiat anim laborum. Proident ipsum in aute est.'
  'Non magna et enim voluptate sit ea occaecat consequat esse id. Duis nostrud voluptate in esse esse. In cillum reprehenderit tempor proident laboris culpa officia mollit ullamco aliquip laboris dolore. Velit anim do occaecat tempor amet culpa in.',
  'Eiusmod sint consectetur proident qui esse laboris. Sit aliquip enim qui ex nulla aliqua. Nostrud cillum mollit Lorem excepteur sunt officia mollit laboris magna. Aliqua eu consequat fugiat anim laborum. Proident ipsum in aute est.'
  'Non magna et enim voluptate sit ea occaecat consequat esse id. Duis nostrud voluptate in esse esse. In cillum reprehenderit tempor proident laboris culpa officia mollit ullamco aliquip laboris dolore. Velit anim do occaecat tempor amet culpa in.',
  'Eiusmod sint consectetur proident qui esse laboris. Sit aliquip enim qui ex nulla aliqua. Nostrud cillum mollit Lorem excepteur sunt officia mollit laboris magna. Aliqua eu consequat fugiat anim laborum. Proident ipsum in aute est.'
  'Non magna et enim voluptate sit ea occaecat consequat esse id. Duis nostrud voluptate in esse esse. In cillum reprehenderit tempor proident laboris culpa officia mollit ullamco aliquip laboris dolore. Velit anim do occaecat tempor amet culpa in.',
  'Eiusmod sint consectetur proident qui esse laboris. Sit aliquip enim qui ex nulla aliqua. Nostrud cillum mollit Lorem excepteur sunt officia mollit laboris magna. Aliqua eu consequat fugiat anim laborum. Proident ipsum in aute est.'
  'Non magna et enim voluptate sit ea occaecat consequat esse id. Duis nostrud voluptate in esse esse. In cillum reprehenderit tempor proident laboris culpa officia mollit ullamco aliquip laboris dolore. Velit anim do occaecat tempor amet culpa in.',
  'Eiusmod sint consectetur proident qui esse laboris. Sit aliquip enim qui ex nulla aliqua. Nostrud cillum mollit Lorem excepteur sunt officia mollit laboris magna. Aliqua eu consequat fugiat anim laborum. Proident ipsum in aute est.'
  'Non magna et enim voluptate sit ea occaecat consequat esse id. Duis nostrud voluptate in esse esse. In cillum reprehenderit tempor proident laboris culpa officia mollit ullamco aliquip laboris dolore. Velit anim do occaecat tempor amet culpa in.',
  'Eiusmod sint consectetur proident qui esse laboris. Sit aliquip enim qui ex nulla aliqua. Nostrud cillum mollit Lorem excepteur sunt officia mollit laboris magna. Aliqua eu consequat fugiat anim laborum. Proident ipsum in aute est.'
  'Non magna et enim voluptate sit ea occaecat consequat esse id. Duis nostrud voluptate in esse esse. In cillum reprehenderit tempor proident laboris culpa officia mollit ullamco aliquip laboris dolore. Velit anim do occaecat tempor amet culpa in.',
  'Eiusmod sint consectetur proident qui esse laboris. Sit aliquip enim qui ex nulla aliqua. Nostrud cillum mollit Lorem excepteur sunt officia mollit laboris magna. Aliqua eu consequat fugiat anim laborum. Proident ipsum in aute est.'
];
