
import 'package:netflix_clone/domain/movie/entities/movie.dart';

abstract class NowPlayingMoviesState {}

class NowPlayingMoviesLoading extends NowPlayingMoviesState {}

class NowPlayingMoviesLoaded extends NowPlayingMoviesState {
  final List<MovieEntity> movies;

  NowPlayingMoviesLoaded({required this.movies});
}

class NowPlayingMoviesFailure extends NowPlayingMoviesState {
  final String errorMessage;

  NowPlayingMoviesFailure({required this.errorMessage});
}