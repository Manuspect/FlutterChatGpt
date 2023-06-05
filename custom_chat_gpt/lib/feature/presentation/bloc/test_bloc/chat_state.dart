part of 'chat_bloc.dart';

abstract class ChatState {}

class ChatInited extends ChatState {}

class MessageSended extends ChatState {
  final String message;

  MessageSended({required this.message});
}
class ResponseGot extends ChatState {
}

class ResponseIsGetting extends ChatState {
  final String message;

  ResponseIsGetting({required this.message});
}
class Regenerating extends ChatState {

}

