// To parse this JSON data, do
//
//     final messageToSend = messageToSendFromJson(jsonString);

import 'dart:convert';

MessageToSend messageToSendFromJson(String str) => MessageToSend.fromJson(json.decode(str));

String messageToSendToJson(MessageToSend data) => json.encode(data.toJson());

class MessageToSend {
  final ChatMessage chatMessage;
  final List<ChatMessage> history;

  MessageToSend({
    required this.chatMessage,
    required this.history,
  });

  factory MessageToSend.fromJson(Map<String, dynamic> json) => MessageToSend(
        chatMessage: ChatMessage.fromJson(json["new_message"]),
        history: List<ChatMessage>.from(json["history"].map((x) => ChatMessage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "new_message": chatMessage.toJson(),
        "history": List<dynamic>.from(history.map((x) => x.toJson())),
      };
}

enum Role { system, user, assistant }

class ChatMessage {
  final Role role;
  final String content;
  bool isSelected;

  ChatMessage({required this.role, required this.content, this.isSelected = false});

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        role: Role.values.byName(json["role"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "role": role.name,
        "content": content,
      };

  @override
  String toString() {
    return '{role: ${role.name}, content: $content}';
  }
}
