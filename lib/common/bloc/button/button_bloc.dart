import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/common/bloc/button/button_event.dart';
import 'package:netflix_clone/common/bloc/button/button_state.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(ButtonInitialState()) {
    on<ButtonExecuteEvent>(_onButtonExecuteEvent);
  }

  Future<void> _onButtonExecuteEvent(
    ButtonExecuteEvent event,
    Emitter<ButtonState> emit,
  ) async {
    print('ButtonExecuteEvent received');
    emit(ButtonLoadingState());
    print('Emitting ButtonLoadingState');

    try {
      Either returnedData = await event.usecase.call(params: event.params);
      returnedData.fold(
        (error) {
          emit(ButtonFailureState(errorMessage: error));
          print('Emitting ButtonFailureState');
        },
        (data) {
          emit(ButtonSuccessState());
          print('Emitting ButtonSuccessState');
        },
      );
    } catch (e) {
      emit(ButtonFailureState(errorMessage: e.toString()));
          print('Error caught: ${e.toString()}');

    }
  }
}
