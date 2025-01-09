import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/domain/movie/usecases/get_trending_movies_usecase.dart';
import 'package:netflix_clone/presentation/home/bloc/trending_movie_state.dart';
import 'package:netflix_clone/service_locator.dart';

class TrendingMovieCubit extends Cubit<TrendingMoviesState> {
  TrendingMovieCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async {
    var returnedData = await sl<GetTrendingMoviesUsecase>().call();
    returnedData.fold(
      (error) {
        emit(TrendingMoviesFailure(errorMessage: error));
      },
      (data) {
        emit(TrendingMoviesLoaded(movies: data));
      },
    );
  }
}
