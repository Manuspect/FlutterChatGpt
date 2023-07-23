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

class UpdateChatEvent extends ChatEvent {}

class GotResponse extends ChatEvent {
  final String? message;

  GotResponse({required this.message});
}

class RegenerateButtonPressed extends ChatEvent {}

class AddNewChat extends ChatEvent {}

class ChatChanged extends ChatEvent {
  final String message;

  ChatChanged({required this.message});
}
