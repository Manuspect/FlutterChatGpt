part of 'editing_bot_bloc.dart';

class EditingBotState {}

class InitialState extends EditingBotState {}

class OpenSlidingPanelState extends EditingBotState {
  
  OpenSlidingPanelState();
}

class OpenSlidingPanelToState extends EditingBotState {
  double height;

  OpenSlidingPanelToState(this.height);
}

class CloseSlidingPanelState extends EditingBotState {}

class HideSlidingPanelState extends EditingBotState {}
