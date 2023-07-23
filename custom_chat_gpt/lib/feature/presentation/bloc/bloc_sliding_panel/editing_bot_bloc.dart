import 'package:flutter_bloc/flutter_bloc.dart';

part 'editing_bot_event.dart';
part 'editing_bot_state.dart';

class EditingBotBloc extends Bloc<EditingBotEvent, EditingBotState> {
  EditingBotBloc() : super(InitialState()) {
    on<OpenSlidingPanelEvent>(_openPanel);
    on<CloseSlidingPanelEvent>(_closePanel);
    on<OpenSlidingPanelToEvent>(_openPanelTo);
    on<HideSlidingPanelEvent>(_hidePanel);
  }

  void _openPanel(OpenSlidingPanelEvent event, Emitter<EditingBotState> emit) async {
    emit(OpenSlidingPanelState());
  }

  void _openPanelTo(OpenSlidingPanelToEvent event, Emitter<EditingBotState> emit) async {
    emit(OpenSlidingPanelToState(event.height));
  }

  void _closePanel(CloseSlidingPanelEvent event, Emitter<EditingBotState> emit) async {
    emit(CloseSlidingPanelState());
  }

  void _hidePanel(HideSlidingPanelEvent event, Emitter<EditingBotState> emit) async {
    emit(HideSlidingPanelState());
  }
}
