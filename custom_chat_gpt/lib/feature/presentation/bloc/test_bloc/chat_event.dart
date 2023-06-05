part of 'chat_bloc.dart';

abstract class ChatEvent {}

class SendMessage extends ChatEvent {
  final String message;

  SendMessage({required this.message});
}
class SendChatMessage extends ChatEvent {
  final String message;

  SendChatMessage({required this.message});
}

class GetResponse extends ChatEvent {
  final String? message;

  GetResponse({required this.message});
}
class GotResponse extends ChatEvent {
  final String? message;

  GotResponse({required this.message});
}


class RegenerateButtonPressed extends ChatEvent {
  
}