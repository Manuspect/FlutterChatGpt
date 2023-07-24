import 'package:custom_chat_gpt/feature/data/models/message_to_send_model.dart';
import 'package:custom_chat_gpt/feature/data/repositories/repository_impl.dart';
import 'package:custom_chat_gpt/feature/presentation/bloc/test_bloc/chat_bloc.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/ai_stream_card.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/chat_message.dart';
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
  late ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    chats = BlocProvider.of<ChatBloc>(context).repository.history;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      buildWhen: (previous, current) {
        // if (current is ResponseGot) return true;
        return true;
      },
      builder: (context, state) {
        return Container(
          // height: 600,
          child: chats.isNotEmpty
              ? SingleChildScrollView(
                reverse: true,
                  controller: scrollController,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      chatMessages(),
                      Builder(builder: (context) {
                        // print(state);

                        //TODO: Сделать ScrollView привязанным к низу при появлении нового элемента

                        scrollController.animateTo(
                          0.0,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300),
                        );

                        return state is! ResponseGot
                            ? const AIStreamCard()
                            : Container();
                      }),
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
            child: SizedBox(
                width: 768,
                child: Column(
                  children: [
                    ...chats.where((element) => element.role != Role.assistant)
                        .map((e) =>  ChatMessageCard(chatMessage: e,))
                        .toList(),
                  ],
                )),
          )
        : const CircularProgressIndicator();
  }
}
