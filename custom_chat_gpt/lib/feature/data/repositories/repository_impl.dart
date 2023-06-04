import 'dart:convert';

import 'package:custom_chat_gpt/feature/data/datasources/response_remote_datasource.dart';
import 'package:custom_chat_gpt/feature/data/models/message_model.dart';
import 'package:custom_chat_gpt/feature/data/models/message_to_send_model.dart';
import 'package:custom_chat_gpt/feature/domain/repositories/repository.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class RepositoryImpl implements Repository {
  ResponseRemoteDatasource remoteDatasource = ResponseRemoteDatasourceImpl(
    WebSocketChannel.connect(
      // Uri.parse('ws://95.165.88.39:80/ws'),
      Uri.parse('wss://echo.websocket.events'),
    ),
  );

  List<ChatMessage> history = [];

  @override
  void sendMessage(String msg) {
    // print(msg);
    // print('msg to send is $msg');
    // MessageModel messageToSent = MessageModel(
    //   content: msg,
    //   chatId: 0,
    //   userId: 0,
    // );
    remoteDatasource.channel.sink.add("{\"message\": \"$msg\"}");
  }

  @override
  void sendChatMessage(ChatMessage chatMessage, List<ChatMessage> history) {
    // messageToSend = MessageToSend(chatMessage: chatMessage, history: history).toJson();
    String messageToSend = json.encode(MessageToSend(chatMessage: chatMessage, history: history).toJson());
    print('messageToSend in sendChatMessage${messageToSend}');
    remoteDatasource.channel.sink.add(messageToSend);
    history.add(chatMessage);
  }
  
  @override
  Stream<List<ChatMessage>> getChats() async* {
    yield history;
  }
  @override
  List<ChatMessage> get getHistory => history;
}
