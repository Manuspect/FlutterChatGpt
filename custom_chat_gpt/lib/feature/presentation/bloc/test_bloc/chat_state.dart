part of 'chat_bloc.dart';

abstract class ChatState {}

class ChatInited extends ChatState {}

class MessageSended extends ChatState {
  final String message;

  MessageSended({required this.message});
}
class ResponseGot extends ChatState {
  final String message;

  ResponseGot({required this.message});
}

class ResponseIsGetting extends ChatState {
  final String message;

  ResponseIsGetting({required this.message});
}

