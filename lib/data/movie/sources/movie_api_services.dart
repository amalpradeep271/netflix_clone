import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix_clone/core/constants/api_url.dart';
import 'package:netflix_clone/core/netwok/dio_client.dart';
import 'package:netflix_clone/service_locator.dart';

abstract class MovieApiServices {
    Future<Either> getTrendingMovies();

}


class MovieApiServicesImpl extends MovieApiServices {
  @override
  Future<Either> getTrendingMovies()async {
     try {
      var response = await sl<DioClient>().get(
        ApiUrl.trendingMovies,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  
}