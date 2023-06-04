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
        chatMessage: ChatMessage.fromJson(json["chat_message"]),
        history: List<ChatMessage>.from(json["history"].map((x) => ChatMessage.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "chat_message": chatMessage.toJson(),
        "history": List<dynamic>.from(history.map((x) => x.toJson())),
    };
}

class ChatMessage {
    final String role;
    final String content;

    ChatMessage({
        required this.role,
        required this.content,
    });

    factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        role: json["role"],
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "role": role,
        "content": content,
    };

    @override
    String toString() {
    // TODO: implement toString
    return '{role: $role, content: $content}';
  }
}
