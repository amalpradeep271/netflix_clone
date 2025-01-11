import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either> getTrendingMovies();
  Future<Either> nowPlayingMovies();
  Future<Either> getMovieTrailer(int movieId);
    Future<Either> getRecommendationMovies(int movieId);

}
