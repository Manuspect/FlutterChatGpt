// import 'package:custom_chat_gpt/feature/data/datasources/response_remote_datasource.dart';
import 'package:custom_chat_gpt/feature/data/models/message_to_send_model.dart';
import 'package:custom_chat_gpt/feature/data/repositories/repository_impl.dart';
// import 'package:custom_chat_gpt/feature/domain/repositories/repository.dart';
import 'package:custom_chat_gpt/feature/presentation/bloc/test_bloc/chat_bloc.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/ai_response_card.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/ai_stream_card.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/user_question_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatContent extends StatefulWidget {
  const ChatContent({super.key});

  @override
  State<ChatContent> createState() => _ChatContentState();
}

class _ChatContentState extends State<ChatContent> {
  RepositoryImpl repository = RepositoryImpl();
  late Stream stream;
  late List<ChatMessage> chats;

  @override
  void initState() {
    
    chats = BlocProvider.of<ChatBloc>(context).repository.getHistory;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      buildWhen: (previous, current) {
        return true;
      },
      builder: (context, state) {
        return Container(
          // height: 600,
          child: chats.isNotEmpty
              ? SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      chatMessages(),
                      Builder(
                        builder: (context) {
                          return state is! ResponseGot ? AIStreamCard() : Container();
                        }
                      ),
                      const SizedBox(
                        height: 150,
                      )
                    ],
                  ),
              )
              : const Center(
                  child: Text('Задайте вопрос'),
                ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  chatMessages() {
    // print('Chats: ${chats}');
    return chats.isNotEmpty
        ? ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            child: Container(
                width: 768,
                child: Column(
                  children: [
                    ...chats
                        .map(
                            (e) => e.role == 'user'
                                ? UserQuestionCard(
                                    message: e.content,
                                  )
                                : AIResponseCard(
                                    message: e.content,
                                  ),
                          )
                          .toList(),
                    ],
                )

                ),
          )
        : const CircularProgressIndicator();
  }
}

