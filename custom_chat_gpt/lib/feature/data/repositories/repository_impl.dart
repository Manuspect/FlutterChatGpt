import 'dart:convert';

import 'package:custom_chat_gpt/feature/data/datasources/response_remote_datasource.dart';
// import 'package:custom_chat_gpt/feature/data/models/message_model.dart';
import 'package:custom_chat_gpt/feature/data/models/message_to_send_model.dart';
import 'package:custom_chat_gpt/feature/domain/repositories/repository.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class RepositoryImpl implements Repository {
  ResponseRemoteDatasource remoteDatasource = ResponseRemoteDatasourceImpl();
  String currentChat = 'default';
  final List<ChatMessage> _history = [];
  final Map<String, List<ChatMessage>> _chats = {};
  RepositoryImpl(){
    _chats[currentChat] = _history;
  }
  @override
  void sendMessage(String msg) {
    remoteDatasource.channel.sink.add("{\"message\": \"$msg\"}");
  }

  @override
  void sendChatMessage(ChatMessage chatMessage, List<ChatMessage> history) {
    remoteDatasource.initWebSocket(
      WebSocketChannel.connect(
        Uri.parse('ws://95.165.88.39:80/ws'),
        // Uri.parse('wss://echo.websocket.events'),
      ),
    );
    // print('in sendChatMessage');
    String messageToSend = json.encode(
        MessageToSend(chatMessage: chatMessage, history: history).toJson());
    // print('messageToSend in sendChatMessage${messageToSend}');
    remoteDatasource.channel.sink.add(messageToSend);
    _history.add(chatMessage);
  }

  @override
  List<ChatMessage> get history => _history;

  @override
  void regenerate() {
    // print('in regenerate');
    _history.removeLast();
    ChatMessage newMessage = _history.removeLast();
    sendChatMessage(newMessage, _history);
  }

  @override
  void addToHistory(ChatMessage chatMessage) {
    _history.add(chatMessage);
  }
  
  @override
  void saveResponse(String msg) {
    addToHistory(ChatMessage(role: Role.assistant, content: msg));
    remoteDatasource.channel.sink.close();
  }
  
  @override
  Map<String, List<ChatMessage>> get chats => _chats;
  
  @override
  void addNewChat(String chatName) {
    // сохранить историю currentHistory
    _chats[currentChat] = _history;
    
    // добавить новый чат в мапу
    _chats.addAll({chatName : []});

    // присвоить currentHistory = []
    _history.clear();
  }
  
  @override
  void loadChat(String chatName) {
    // сохранить историю currentHistory
    _chats[currentChat] = _history;

    // загрузить новую историю:
    // currentHistory = _chats[chatName]
    _history.clear();
    _history.addAll(_chats[chatName]!);
  }
}
