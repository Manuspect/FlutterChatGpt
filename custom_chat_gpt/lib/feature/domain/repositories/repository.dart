
import '../../data/models/message_to_send_model.dart';

abstract class Repository {
    
  void sendMessage(String msg);
  void sendChatMessage(ChatMessage chatMessage, List<ChatMessage> history);

  List<ChatMessage> get history;
  Map<String, List<ChatMessage>> get chats;
  
  void regenerate();
  void addToHistory(ChatMessage chatMessage);
  void saveResponse(String msg);
  void addNewChat(String chatName);
  void loadChat(String chatName);
}