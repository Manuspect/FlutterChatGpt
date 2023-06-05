import 'package:custom_chat_gpt/feature/presentation/bloc/test_bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'ai_response_card.dart';

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
    _channel.sink.done.then((value) {
      BlocProvider.of<ChatBloc>(context).add(GotResponse(message: res));
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AIResponseCard(message: res);
  }
}
