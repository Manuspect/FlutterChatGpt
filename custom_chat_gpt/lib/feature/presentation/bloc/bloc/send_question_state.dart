part of 'send_question_bloc.dart';

abstract class SendQuestionState extends Equatable {
  final List<String> chatStory = [];
  SendQuestionState();
  
  @override
  List<Object> get props => [chatStory];
}

class QuestionAdd extends SendQuestionState {
  final List<String> chatStory;
  QuestionAdd({required this.chatStory});
}

class AIResponding extends SendQuestionState {

}
