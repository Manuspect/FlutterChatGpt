// import 'package:custom_chat_gpt/feature/domain/entities/message_entity.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class ResponseRemoteDatasource {
  WebSocketChannel get channel;
  Stream aiResponseStream();
  void initWebSocket(WebSocketChannel channel);
}
class ResponseRemoteDatasourceImpl implements ResponseRemoteDatasource {
  late WebSocketChannel _channel;
  @override
  WebSocketChannel get channel => _channel;
  


  ResponseRemoteDatasourceImpl();
  //  = WebSocketChannel.connect(Uri.parse('wss://echo.websocket.events'),);
  
  @override
  Stream aiResponseStream() async*{
    yield* _channel.stream; 
  }
  
  @override
  void initWebSocket(WebSocketChannel channel) {
    _channel = channel;
  }

}