import 'package:netflix_clone/domain/movie/entities/movie.dart';

abstract class TrendingMoviesState {}

class TrendingMoviesLoading extends TrendingMoviesState {}

class TrendingMoviesLoaded extends TrendingMoviesState {
  final List<MovieEntity> movies;

  TrendingMoviesLoaded({required this.movies});
}

class TrendingMoviesFailure extends TrendingMoviesState {
  final String errorMessage;

  TrendingMoviesFailure({required this.errorMessage});
}
