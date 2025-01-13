import 'package:dartz/dartz.dart';
import 'package:netflix_clone/common/helper/mapper/movie_mapper.dart';
import 'package:netflix_clone/common/helper/mapper/trailer_mapper.dart';
import 'package:netflix_clone/data/movie/models/movie.dart';
import 'package:netflix_clone/data/movie/models/trailer.dart';
import 'package:netflix_clone/data/movie/sources/movie_api_services.dart';
import 'package:netflix_clone/domain/movie/repositories/movie.dart';
import 'package:netflix_clone/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returnedData = await sl<MovieApiServices>().getTrendingMovies();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['results'])
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> nowPlayingMovies() async {
    var returnedData = await sl<MovieApiServices>().nowPlayingMovies();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['results'])
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    var returnedData = await sl<MovieApiServices>().getMovieTrailer(movieId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        if (data['results'].isEmpty) {
          return Left("No Trailer found");
        }
        var firstData = data['results'][0];
        var dat = TrailerMapper.toEntity(TrailerModel.fromJson(firstData));
        return Right(dat);
      },
    );
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    var returnedData =
        await sl<MovieApiServices>().getRecommendationMovies(movieId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['results'])
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async {
    var returnedData = await sl<MovieApiServices>().getSimilarMovies(movieId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['results'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> searchMovie(String query) async{
   var returnedData = await sl<MovieApiServices>().searchMovie(query);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['results'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }
}
