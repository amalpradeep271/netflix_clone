import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/domain/movie/usecases/get_trending_movies_usecase.dart';
import 'package:netflix_clone/presentation/home/bloc/trendings/trending_movie_event.dart';
import 'package:netflix_clone/presentation/home/bloc/trendings/trending_movie_state.dart';
import 'package:netflix_clone/service_locator.dart';

class TrendingMoviesBloc extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  TrendingMoviesBloc() : super(TrendingMoviesLoading()) {
    on<FetchTrendingMovies>((event, emit) async {
      emit(TrendingMoviesLoading());
      var returnedData = await sl<GetTrendingMoviesUsecase>().call();
      returnedData.fold(
        (error) {
          emit(TrendingMoviesFailure(errorMessage: error));
        },
        (data) {
          emit(TrendingMoviesLoaded(movies: data));
        },
      );
    });
  }
}
