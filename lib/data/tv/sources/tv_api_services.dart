import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix_clone/core/constants/api_url.dart';
import 'package:netflix_clone/core/netwok/dio_client.dart';
import 'package:netflix_clone/service_locator.dart';

abstract class TvApiServices {
  Future<Either> getPopularTv();
}

class TvApiServicesImpl extends TvApiServices {
  @override
  Future<Either> getPopularTv()async {
      try {
      var response = await sl<DioClient>().get(
        ApiUrl.popularTv,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['status_message']);
    }
  }
}
