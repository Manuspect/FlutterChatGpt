part of 'editing_bot_bloc.dart';

class EditingBotEvent {}

class OpenSlidingPanelEvent extends EditingBotEvent {

  OpenSlidingPanelEvent();
}

class CloseSlidingPanelEvent extends EditingBotEvent {}

class HideSlidingPanelEvent extends EditingBotEvent {}

class OpenSlidingPanelToEvent extends EditingBotEvent {
  double height;

  OpenSlidingPanelToEvent(this.height);
}
