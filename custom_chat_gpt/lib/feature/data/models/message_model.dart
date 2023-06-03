import 'package:custom_chat_gpt/feature/domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  final String content;
  final int chatId;
  final int userId;

  const MessageModel({
    required this.content,
    this.chatId = 0,
    this.userId = 0,
  }) : super(content: '');

  // factory MessageModel.fromJson(Map<String, dynamic> json) {
  //   return MessageModel(
  //       content: json['content'],
  //       chatId: json['chatId'],
  //       userId: json['userId']);
  // }
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      content: json['content'],
      chatId: 0,
      userId: 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'userId': userId,
      'chatId': chatId,
    };
  }
}
