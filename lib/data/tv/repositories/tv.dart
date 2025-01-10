import 'package:dartz/dartz.dart';
import 'package:netflix_clone/common/helper/mapper/tv_mapper.dart';
import 'package:netflix_clone/data/tv/models/tv.dart';
import 'package:netflix_clone/data/tv/sources/tv_api_services.dart';
import 'package:netflix_clone/domain/tv/repositories/tv.dart';
import 'package:netflix_clone/service_locator.dart';

class TvRepositoryImpl extends TvRepository {
  @override
  Future<Either> getPopularTv() async {
    var returnedData = await sl<TvApiServices>().getPopularTv();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['results'])
            .map((item) => TvMapper.toEntity(TvModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }
}
