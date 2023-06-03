import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String content;
  final String chatId;
  final String userId;

  const MessageEntity({
      required this.content,
      this.chatId = 'undefined',
      this.userId = 'undefined'
      });

  @override
  List<Object?> get props => [content, chatId, userId];
}
