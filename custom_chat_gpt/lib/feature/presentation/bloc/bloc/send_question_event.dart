part of 'send_question_bloc.dart';

abstract class SendQuestionEvent extends Equatable {
  final String message;
  const SendQuestionEvent(this.message);

  @override
  List<Object> get props => [message];
}

class SendButtonPressed extends SendQuestionEvent {
  const SendButtonPressed(super.message);
}