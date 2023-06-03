import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String content;
  final int chatId;
  final int userId;

  const MessageEntity({
      required this.content,
      this.chatId = 0,
      this.userId = 0,
      });

  @override
  List<Object?> get props => [content, chatId, userId];
}
