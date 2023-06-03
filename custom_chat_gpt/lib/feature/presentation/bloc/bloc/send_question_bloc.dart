import 'package:bloc/bloc.dart';
import 'package:custom_chat_gpt/feature/data/repositories/repository_impl.dart';
import 'package:custom_chat_gpt/feature/domain/repositories/repository.dart';
import 'package:equatable/equatable.dart';

part 'send_question_event.dart';
part 'send_question_state.dart';

class SendQuestionBloc extends Bloc<SendQuestionEvent, SendQuestionState> {
  RepositoryImpl repository = RepositoryImpl();
  // final List<String> chatStory = [];
  // final String message;
  
  SendQuestionBloc() : super(QuestionAdd(chatStory: []))   {
    on<SendQuestionEvent>((event, emit) {
      repository.sendMessage(event.message);
      state.chatStory.add(event.message);
      emit(state);
      print(state.chatStory);
    });
  }
}
