
import '../../data/models/message_to_send_model.dart';

abstract class Repository {
    
  void sendMessage(String msg);
  void sendChatMessage(ChatMessage chatMessage, List<ChatMessage> history);
  Stream<List<ChatMessage>> getChats();
  List<ChatMessage> get getHistory;
}