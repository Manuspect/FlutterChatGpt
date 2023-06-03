import 'package:custom_chat_gpt/feature/data/datasources/response_remote_datasource.dart';
import 'package:custom_chat_gpt/feature/data/repositories/repository_impl.dart';
import 'package:custom_chat_gpt/feature/domain/repositories/repository.dart';
import 'package:custom_chat_gpt/feature/presentation/bloc/bloc/send_question_bloc.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/ai_response_card.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/user_question_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatContent extends StatefulWidget {
  const ChatContent({super.key});

  @override
  State<ChatContent> createState() => _ChatContentState();
}

class _ChatContentState extends State<ChatContent> {
  RepositoryImpl repository = RepositoryImpl();
  // bool isAIResponse = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendQuestionBloc, SendQuestionState>(
      buildWhen: (previous, current) {
        print(current.chatStory);
        return true;
      },
      // bloc: SendQuestionBloc(),
      builder: (context, state) {
        print(state);
        return Container(
          width: 768,
          child: state.chatStory.isNotEmpty
              ? ListView(
                  children: [
                    ...state.chatStory.map((e) {
                      return Column(
                        children: [
                          UserQuestionCard(
                            message: e,
                          ),
                          StreamBuilder(
                            stream: context.read<SendQuestionBloc>().repository.remoteDatasource.channel.stream,
                              // stream: repository.remoteDatasource.channel.stream,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return AIResponseCard(
                                    message: snapshot.data,
                                  );
                                } else {
                                  return const Text('...');
                                }
                              }),
                        ],
                      );
                    }).toList(),
                    const SizedBox(
                      height: 150,
                    )
                  ],
                )
              : const Center(child: Text('Задайте вопрос')),
        );
      },
    );
  }
  @override
  void dispose() {
    repository.remoteDatasource.channel.sink.close();
    super.dispose();
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
