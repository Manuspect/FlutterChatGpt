import 'dart:developer';

import 'package:custom_chat_gpt/feature/data/models/message_to_send_model.dart';
import 'package:custom_chat_gpt/feature/presentation/bloc/test_bloc/chat_bloc.dart';
import 'package:custom_chat_gpt/feature/presentation/pages/home_page.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class AIStreamCard extends StatefulWidget {
  const AIStreamCard({super.key});

  @override
  State<AIStreamCard> createState() => _AIStreamCardState();
}

class _AIStreamCardState extends State<AIStreamCard> {
  late WebSocketChannel _channel;
  String res = '';

  @override
  void initState() {
    _channel = BlocProvider.of<ChatBloc>(context).repository.remoteDatasource.channel;

    _channel.stream.listen((event) {
      setState(() {
        res += event;
      });
    });
    _channel.sink.done.then(
      (value) {
        BlocProvider.of<ChatBloc>(context).add(GotResponse(message: res));
      },
    );
    super.initState();
    if (res != '') {
      chats.add(ChatMessage(role: Role.assistant, content: res));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChatMessageCard(chatMessage: ChatMessage(role: Role.assistant, content: res));
  }
}
