import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix_clone/core/constants/api_url.dart';
import 'package:netflix_clone/core/netwok/dio_client.dart';
import 'package:netflix_clone/service_locator.dart';

abstract class TvApiServices {
  Future<Either> getPopularTv();
  Future<Either> getRecommendationTv(int tvId);
  Future<Either> getSimilarTv(int tvId);
  Future<Either> getKeywords(int tvId);
}

class TvApiServicesImpl extends TvApiServices {
  @override
  Future<Either> getPopularTv() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.popularTv,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['status_message']);
    }
  }

  @override
  Future<Either> getRecommendationTv(int tvId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tvBase}$tvId/recommendations',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['status_message']);
    }
  }

  @override
  Future<Either> getSimilarTv(int tvId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tvBase}$tvId/similar',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['status_message']);
    }
  }

  @override
  Future<Either> getKeywords(int tvId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tvBase}$tvId/keywords',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['status_message']);
    }
  }
}
