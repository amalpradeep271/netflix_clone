import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/domain/tv/usecases/get_popular_tv_usecase.dart';
import 'package:netflix_clone/presentation/home/bloc/popular_tv/popular_tv_event.dart';
import 'package:netflix_clone/presentation/home/bloc/popular_tv/popular_tv_state.dart';
import 'package:netflix_clone/service_locator.dart';

class PopularTvBloc
    extends Bloc<PopularTvEvent, PopularTvState> {
  PopularTvBloc() : super(PopularTvLoading()) {
    on<FetchPopularTv>((event, emit) async {
      emit(PopularTvLoading());
      var returnedData = await sl<GetPopularTvUsecase>().call();
      returnedData.fold(
        (error) {
          emit(PopularTvFailure(errorMessage: error));
        },
        (data) {
          emit(PopularTvLoaded(tv: data));
        },
      );
    });
  }
}