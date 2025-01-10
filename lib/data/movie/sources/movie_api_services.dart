import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix_clone/core/constants/api_url.dart';
import 'package:netflix_clone/core/netwok/dio_client.dart';
import 'package:netflix_clone/service_locator.dart';

abstract class MovieApiServices {
  Future<Either> getTrendingMovies();
  Future<Either> nowPlayingMovies();
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
}
