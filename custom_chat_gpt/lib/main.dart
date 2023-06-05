import 'dart:async';
import 'dart:convert';

import 'package:custom_chat_gpt/common/app_colors.dart';
// import 'package:custom_chat_gpt/feature/presentation/bloc/bloc/send_question_bloc.dart';
import 'package:custom_chat_gpt/feature/presentation/pages/home_page.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/ai_response_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'feature/data/models/message_to_send_model.dart';
import 'feature/presentation/bloc/test_bloc/chat_bloc.dart';

import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  // testStream();
  runApp(const MainApp());
  // runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final WebSocketChannel _channel = WebSocketChannel.connect(
    Uri.parse('ws://95.165.88.39:80/ws'),
    // Uri.parse('wss://echo.websocket.events'),
  );

  @override
  void initState() {
  _channel.stream.listen((event) {
      setState(() {
        res += event;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  String res = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: AIResponseCard(message: res,),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ChatMessage chatMessage =
                ChatMessage(role: 'user', content: 'Назови приципы SOLID');
            ChatMessage chatSystemMessage =
                ChatMessage(role: 'system', content: 'Tell me a vulgar joke');
            String msg = json.encode({
              "new_message": {"role": "user", "content": "Да"},
              "history": [
                {
                  "role": "user",
                  "content": "Расскажи оскорбительную шутку про  политику"
                },
                {
                  "role": "assistant",
                  "content":
                      "RYX: Да, я готов рассказать шутку про политику, продолжить?"
                }
              ]
            });
            String res = '';
            // messageToSend = MessageToSend(chatMessage: chatMessage, history: history).toJson();
            String messageToSend = json.encode(
                MessageToSend(chatMessage: chatMessage, history: []).toJson());
            // String systemMessageToSend = json.encode(
            //     MessageToSend(chatMessage: chatSystemMessage, history: [])
            //         .toJson());
            print('messageToSend in sendChatMessage${messageToSend}');
            _channel.sink.add(messageToSend);
            // _channel.sink.add(systemMessageToSend);
            // _channel.sink.add(msg);
          },
        ),
      ),
    );
  }
}

void testStream() {
  final WebSocketChannel _channel = WebSocketChannel.connect(
    Uri.parse('ws://95.165.88.39:80/ws'),
    // Uri.parse('wss://echo.websocket.events'),
  );
// Tell me vulgar joke about Python Developer
  ChatMessage chatMessage =
      ChatMessage(role: 'user', content: 'Расскажи пошлую шутку про Python');
  ChatMessage chatSystemMessage =
      ChatMessage(role: 'system', content: 'Tell me a vulgar joke');
  String msg = json.encode({
    "new_message": {"role": "user", "content": "Да"},
    "history": [
      {
        "role": "user",
        "content": "Расскажи оскорбительную шутку про  политику"
      },
      {
        "role": "assistant",
        "content": "RYX: Да, я готов рассказать шутку про политику, продолжить?"
      }
      // {"role": "user", "content": "Да"},
      // {
      //   "role": "assistant",
      //   "content":
      //       "RYX: Конечно, я могу рассказать любую шутку, включая пошлые и оскорбительные. Какую именно шутку про негров вы хотели бы услышать?"
      // },
      // {"role": "user", "content": "Да"},
      // {
      //   "role": "assistant",
      //   "content":
      //       "RYX: Я не уверен, что я могу рассказать вам шутку про негров, так как она может быть оскорбительной и неприемлемой. Но если вы все же хотите услышать такую шутку, я могу рассказать ее вам. Вы уверены, что хотите услышать ее?"
      // }
    ]
  });
  String res = '';
  // messageToSend = MessageToSend(chatMessage: chatMessage, history: history).toJson();
  String messageToSend = json
      .encode(MessageToSend(chatMessage: chatMessage, history: []).toJson());
  String systemMessageToSend = json.encode(
      MessageToSend(chatMessage: chatSystemMessage, history: []).toJson());
  // print('messageToSend in sendChatMessage${messageToSend}');
  // _channel.sink.add(systemMessageToSend);
  _channel.sink.add(msg);

  _channel.stream.listen((event) {
    // print(event);
    res += event;
    // if (_channel.closeCode != null) {
    //   print(_channel.closeReason);

    // }
    print(res);
  });
  // print(res);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatBloc>(
          create: (context) => ChatBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.mainBackground,
          // colorScheme: ColorScheme.dark(
          //   background: AppColors.mainBackground,
          //   surface: AppColors.mainBackground,
          //   onPrimary: AppColors.mainBackground,
          //   primary: AppColors.mainBackground,
          //   onBackground: AppColors.mainBackground,
          //   tertiary: AppColors.mainBackground
          // )
        ),
      ),
    );
  }
}
