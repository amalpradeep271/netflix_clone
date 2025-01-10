import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/domain/movie/usecases/get_now_playing_movies_usecase.dart';
import 'package:netflix_clone/presentation/home/bloc/now_playing/now_playing_movie_event.dart';
import 'package:netflix_clone/presentation/home/bloc/now_playing/now_playing_movie_state.dart';
import 'package:netflix_clone/service_locator.dart';

class NowPlayingMoviesBloc
    extends Bloc<NowPlayingMoviesEvent, NowPlayingMoviesState> {
  NowPlayingMoviesBloc() : super(NowPlayingMoviesLoading()) {
    on<FetchNowPlayingMovies>((event, emit) async {
      emit(NowPlayingMoviesLoading());
      var returnedData = await sl<GetNowPlayingMoviesUsecase>().call();
      returnedData.fold(
        (error) {
          emit(NowPlayingMoviesFailure(errorMessage: error));
        },
        (data) {
          emit(NowPlayingMoviesLoaded(movies: data));
        },
      );
    });
  }
}
