import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix_clone/core/constants/api_url.dart';
import 'package:netflix_clone/core/netwok/dio_client.dart';
import 'package:netflix_clone/service_locator.dart';

abstract class MovieApiServices {
  Future<Either> getTrendingMovies();
  Future<Either> nowPlayingMovies();
  Future<Either> getMovieTrailer(int movieId);
  Future<Either> getRecommendationMovies(int movieId);
  Future<Either> getSimilarMovies(int movieId);
}

class MovieApiServicesImpl extends MovieApiServices {
  @override
  Future<Either> getTrendingMovies() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.trendingMovies,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['status_message']);
    }
  }

  @override
  Future<Either> nowPlayingMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.nowplayingMovies);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['status_message']);
    }
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    try {
      var response =
          await sl<DioClient>().get('${ApiUrl.movieTrailer}$movieId/videos');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['status_message']);
    }
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    try {
      var response = await sl<DioClient>()
          .get('${ApiUrl.movieTrailer}$movieId/recommendations');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['status_message']);
    }
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async {
    try {
      var response =
          await sl<DioClient>().get('${ApiUrl.movieTrailer}$movieId/similar');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['status_message']);
    }
  }
}
