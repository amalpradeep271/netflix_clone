import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/common/bloc/generic_data/generic_data_event.dart';
import 'package:netflix_clone/common/bloc/generic_data/generic_data_state.dart';

class GenericDataBloc extends Bloc<GenericDataEvent, GenericDataState> {
  GenericDataBloc() : super(DataLoading()) {
    on<FetchData>(_onFetchData);
  }

  Future<void> _onFetchData<T>(
    FetchData<T> event,
    Emitter<GenericDataState> emit,
  ) async {
    emit(DataLoading());
    final result = await event.usecase.call(params: event.params);
    result.fold(
      (error) {
        emit(FailureLoadData(errorMessage: error));
      },
      (data) {
        emit(DataLoaded<T>(data: data));
      },
    );
  }
}
