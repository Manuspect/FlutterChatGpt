import 'package:custom_chat_gpt/feature/data/models/message_to_send_model.dart';
import 'package:custom_chat_gpt/feature/data/repositories/repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  RepositoryImpl repository = RepositoryImpl();

  ChatBloc() : super(ChatInited()) {
    // on<SendMessage>(
    //   (event, emit) {
    //     repository.sendMessage(event.message);
    //     emit(
    //       MessageSended(message: event.message),
    //     );
    //   },
    // );

    on<SendChatMessage>(
      (event, emit) {
        ChatMessage chatMessage =
            ChatMessage(role: Role.user, content: event.message);
        repository.sendChatMessage(chatMessage, repository.getHistory);
        emit(
          MessageSended(message: event.message),
        );
      },
    );

    // on<GetResponse>(
    //   (event, emit) {
    //     return;
    //   },
    // );

    on<GotResponse>(
      (event, emit) {
        repository.saveResponse(event.message!);
        print('in GotResponse');
        // repository.addToHistory(ChatMessage(
        //     role: Role.assistant, content: event.message ?? 'No response'));
        // // print('history from bloc');
        // // print(repository.getHistory);
        // repository.remoteDatasource.channel.sink.close();
        emit(ResponseGot());
      },
    );

    on<RegenerateButtonPressed>(
      (event, emit) {
        print('In event');
        repository.regenerate();
        emit(Regenerating());

      },
    );
  }
}
