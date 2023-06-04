// import 'package:custom_chat_gpt/feature/domain/entities/message_entity.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class ResponseRemoteDatasource {
  WebSocketChannel get channel;
  Stream aiResponseStream();
}
class ResponseRemoteDatasourceImpl implements ResponseRemoteDatasource {
  final WebSocketChannel _channel;
  @override
  WebSocketChannel get channel => _channel;
  
  ResponseRemoteDatasourceImpl(this._channel);
  //  = WebSocketChannel.connect(Uri.parse('wss://echo.websocket.events'),);
  
  @override
  Stream aiResponseStream() async*{
    yield* _channel.stream; 
  }

}